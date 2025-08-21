#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import logging
import logging.config
import sys
import queue
import math

# === 修复 ROS 日志配置崩溃问题 ===
def safe_file_config(*args, **kwargs):
    try:
        logging.config.fileConfig(*args, **kwargs)
    except Exception as e:
        sys.stderr.write("--- PATCHED ---\n")
        sys.stderr.write("WARNING: An error occurred while trying to load a logging config file. Ignoring it.\n")
        sys.stderr.write(f"Error details: {e}\n")
        sys.stderr.write("--- END PATCH ---\n")
logging.config.fileConfig = safe_file_config

import rospy
import os
if 'ROSCONSOLE_CONFIG_FILE' in os.environ:
    del os.environ['ROSCONSOLE_CONFIG_FILE']

import time
import numpy as np
import cv2
import pygame
import threading

import message_filters
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from rknnlite.api import RKNNLite

RKNN_MODEL_PATH = '/home/orangepi/catkin_ws/src/astra_camera/scripts/best6.rknn'
MODEL_INPUT_SIZE = 640
CONF_THRESHOLD = 0.3
NMS_THRESHOLD = 0.5
ALARM_CLASS_NAME = "pen"
ALARM_AUDIO_PATH = "/home/orangepi/catkin_ws/src/astra_camera/scripts/alarm.wav"
ALARM_BOX_COLOR = (0, 0, 255)  # Red for alarm
NORMAL_BOX_COLOR = (0, 255, 0) # Green for normal

# 你的CLASSES列表有29个类别
CLASSES = (
    "people", "pen", "laptop", "trashcan", "kitchen_utensils",
    "windows", "lamps", "electric_fans", "tea_sets", "green_plants",
    "doors", "door_handles", "rags", "brooms", "boxes",
    "sofas", "mobile_phones", "books", "vegetables", "water_cups",
    "fruits", "mops", "socks", "shoes", "hangers",
    "paper_towels", "paper", "chairs", "tables"
)
# 检查 'fall' 是否在里面, 如果没有，你可能需要添加它，如果你的模型训练过这个类别
# 例如: CLASSES = ("people", ..., "tables", "fall")

def letterbox(img, new_shape=(640, 640), color=(114, 114, 114)):
    shape = img.shape[:2]
    ratio = min(new_shape[0]/shape[0], new_shape[1]/shape[1])
    new_unpad = (int(round(shape[1]*ratio)), int(round(shape[0]*ratio)))
    dw, dh = new_shape[1] - new_unpad[0], new_shape[0] - new_unpad[1]
    dw /= 2
    dh /= 2
    img = cv2.resize(img, new_unpad, interpolation=cv2.INTER_LINEAR)
    top, bottom = int(round(dh-0.1)), int(round(dh+0.1))
    left, right = int(round(dw-0.1)), int(round(dw+0.1))
    img = cv2.copyMakeBorder(img, top, bottom, left, right, cv2.BORDER_CONSTANT, value=color)
    return img, (ratio, ratio), (dw, dh)

# <--- 关键修改点: 彻底重写后处理函数以匹配 (N, 4 + 1 + num_classes) 格式
def post_process_single_output(output, conf_thres, nms_thres):
    """
    Processes the anchor-based model output.
    Assumes output shape is (num_predictions, 4_box + 1_conf + num_classes).
    """
    # 提取包围框、物体置信度和类别分数
    boxes = output[:, :4]
    objectness = output[:, 4]
    class_scores = output[:, 5:]

    # 将物体置信度与类别分数相乘，得到最终的类别置信度
    final_scores = objectness[:, np.newaxis] * class_scores

    # 找到每个预测框的最高分及其对应的类别ID
    confidences = np.max(final_scores, axis=1)
    class_ids = np.argmax(final_scores, axis=1)
    
    # 过滤掉置信度低于阈值的预测
    mask = confidences > conf_thres
    boxes = boxes[mask]
    confidences = confidences[mask]
    class_ids = class_ids[mask]

    if len(boxes) == 0:
        return None, None, None

    # 将框的格式从 (center_x, center_y, w, h) 转换为 (x1, y1, x2, y2)
    # 这是 NMS 函数需要的格式
    boxes_xyxy = np.zeros_like(boxes)
    boxes_xyxy[:, 0] = boxes[:, 0] - boxes[:, 2] / 2
    boxes_xyxy[:, 1] = boxes[:, 1] - boxes[:, 3] / 2
    boxes_xyxy[:, 2] = boxes[:, 0] + boxes[:, 2] / 2
    boxes_xyxy[:, 3] = boxes[:, 1] + boxes[:, 3] / 2

    # 执行非极大值抑制 (NMS)
    indices = cv2.dnn.NMSBoxes(boxes_xyxy.tolist(), confidences.tolist(), conf_thres, nms_thres)

    if not isinstance(indices, np.ndarray):
        return None, None, None
        
    if len(indices) == 0:
        return None, None, None

    indices = indices.flatten()
    return boxes_xyxy[indices], confidences[indices], class_ids[indices]


class YoloDetectorNode:
    def __init__(self):
        rospy.init_node('yolo_detector_node', anonymous=True)
        self.image_queue = queue.Queue(maxsize=2)
        self.rknn_lite = RKNNLite()
        rospy.loginfo("Loading RKNN model...")
        ret = self.rknn_lite.load_rknn(RKNN_MODEL_PATH)
        if ret != 0:
            rospy.logfatal(f"Failed to load RKNN model, error code: {ret}")
            sys.exit(ret)
        rospy.loginfo("Initializing RKNN runtime...")
        ret = self.rknn_lite.init_runtime(core_mask=RKNNLite.NPU_CORE_0)
        if ret != 0:
            rospy.logfatal(f"RKNN init_runtime failed, error code: {ret}")
            sys.exit(ret)
        rospy.loginfo("RKNN model loaded and initialized successfully.")
        self.is_alarm_playing = False
        try:
            pygame.mixer.init()
            self.alarm_sound = pygame.mixer.Sound(ALARM_AUDIO_PATH)
        except Exception as e:
            rospy.logerr(f"Pygame alarm sound load failed: {e}")
            self.alarm_sound = None
        self.bridge = CvBridge()
        self.result_pub = rospy.Publisher('/detection/image_annotated', Image, queue_size=1)
        color_topic = rospy.get_param('~color_topic', '/camera/color/image_raw')
        depth_topic = rospy.get_param('~depth_topic', '/camera/aligned_depth_to_color/image_raw')
        color_sub = message_filters.Subscriber(color_topic, Image)
        depth_sub = message_filters.Subscriber(depth_topic, Image)
        self.ts = message_filters.ApproximateTimeSynchronizer([color_sub, depth_sub], queue_size=10, slop=0.1)
        self.ts.registerCallback(self.image_callback_producer)
        rospy.on_shutdown(self.cleanup)

    def cleanup(self):
        rospy.loginfo("Shutting down yolo_detector_node.")
        if self.alarm_sound and self.is_alarm_playing:
            self.alarm_sound.stop()
        if pygame.get_init():
             pygame.mixer.quit()
        self.rknn_lite.release()
        cv2.destroyAllWindows()
        
    def image_callback_producer(self, color_msg, depth_msg):
        try:
            if self.image_queue.full():
                self.image_queue.get_nowait()
            self.image_queue.put((color_msg, depth_msg), block=False)
        except queue.Full:
            pass
        except Exception as e:
            rospy.logerr(f"Error in producer callback: {e}")

    def run_inference_loop(self):
        rospy.loginfo("Yolo detector node started. Waiting for images...")
        frame_count = 0 
        while not rospy.is_shutdown():
            try:
                color_msg, depth_msg = self.image_queue.get(timeout=1.0)
            except queue.Empty:
                continue
            
            try:
                frame = self.bridge.imgmsg_to_cv2(color_msg, "bgr8")
            except Exception as e:
                rospy.logerr(f"cv_bridge error: {e}")
                continue

            h, w = frame.shape[:2]
            img, ratio, (dw, dh) = letterbox(frame, (MODEL_INPUT_SIZE, MODEL_INPUT_SIZE))
            img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
            img = np.expand_dims(img, axis=0)
            img = img.transpose(0, 3, 1, 2)

            outputs = self.rknn_lite.inference(inputs=[img])
            
            # <--- 关键修改点在这里 ---
            if outputs and len(outputs) > 0:
                model_output = outputs[0]
                
                # 从 (1, 64, 80, 80) 变形为我们需要的格式
                # 1. Squeeze the batch dimension: (64, 80, 80)
                model_output = model_output.squeeze(0)
                # 2. Permute dimensions from (C, H, W) to (H, W, C): (80, 80, 64)
                model_output = model_output.transpose(1, 2, 0)
                # 3. Reshape to (num_predictions, features): (80*80, 64) -> (6400, 64)
                num_predictions = model_output.shape[0] * model_output.shape[1]
                processed_output = model_output.reshape(num_predictions, -1)

                if frame_count == 0:
                    print(f"DEBUG: Original model output shape: {outputs[0].shape}")
                    print(f"DEBUG: Reshaped output for post-processing: {processed_output.shape}")

                boxes, scores, class_ids = post_process_single_output(processed_output, CONF_THRESHOLD, NMS_THRESHOLD)
            else:
                boxes, scores, class_ids = (None, None, None)
            
            frame_count += 1
            # --- 修改结束 ---

            fall_detected = False
            if boxes is not None:
                boxes[:, [0, 2]] -= dw
                boxes[:, [1, 3]] -= dh
                boxes /= ratio[0]
                boxes[:, [0, 2]] = np.clip(boxes[:, [0, 2]], 0, w)
                boxes[:, [1, 3]] = np.clip(boxes[:, [1, 3]], 0, h)

                for i in range(len(boxes)):
                    x1, y1, x2, y2 = boxes[i].astype(int)
                    cls_id = int(class_ids[i])
                    # 你的模型输出有 64 - 4 - 1 = 59 个类别分数，但你的CLASSES列表只有29个
                    # 这里需要确保cls_id不会越界
                    if cls_id < len(CLASSES):
                        label = CLASSES[cls_id]
                    else:
                        label = f"ClassID:{cls_id}"
                        rospy.logwarn_throttle(10, f"Model detected class ID {cls_id} which is not in the CLASSES list.")

                    score = scores[i]
                    color = ALARM_BOX_COLOR if label == ALARM_CLASS_NAME else NORMAL_BOX_COLOR
                    if label == ALARM_CLASS_NAME:
                        fall_detected = True
                    cv2.rectangle(frame, (x1, y1), (x2, y2), color, 2)
                    cv2.putText(frame, f"{label} {score:.2f}", (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.6, color, 2)

            if fall_detected and not self.is_alarm_playing:
                if self.alarm_sound: self.alarm_sound.play(loops=-1)
                self.is_alarm_playing = True
                rospy.logwarn("FALL DETECTED")
            elif not fall_detected and self.is_alarm_playing:
                if self.alarm_sound: self.alarm_sound.stop()
                self.is_alarm_playing = False

            if self.is_alarm_playing:
                cv2.putText(frame, "FALL DETECTED!", (50, 80), cv2.FONT_HERSHEY_TRIPLEX, 1.5, (0,0,255), 3)

            self.result_pub.publish(self.bridge.cv2_to_imgmsg(frame, "bgr8"))
            cv2.imshow("Detection Result", frame)
            cv2.waitKey(1)

if __name__ == '__main__':
    try:
        node = YoloDetectorNode()
        node.run_inference_loop()
    except (rospy.ROSInterruptException, KeyboardInterrupt):
        pass
    finally:
        if 'node' in locals() and node:
            node.cleanup()