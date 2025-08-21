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
CONF_THRESHOLD = 0.4 
NMS_THRESHOLD = 0.5
REG_MAX = 16 # YOLOv8 DFL头的关键参数

ALARM_CLASS_NAME = "pen" 
ALARM_AUDIO_PATH = "/home/orangepi/catkin_ws/src/astra_camera/scripts/alarm.wav"
ALARM_BOX_COLOR = (0, 0, 255)  # Red for alarm
NORMAL_BOX_COLOR = (0, 255, 0) # Green for normal

CLASSES = (
    "people", "pen", "laptop", "trashcan", "kitchen_utensils",
    "windows", "lamps", "electric_fans", "tea_sets", "green_plants",
    "doors", "door_handles", "rags", "brooms", "boxes",
    "sofas", "mobile_phones", "books", "vegetables", "water_cups",
    "fruits", "mops", "socks", "shoes", "hangers",
    "paper_towels", "paper", "chairs", "tables"
)
NUM_CLASSES = len(CLASSES)

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

def _sigmoid(x):
    return 1 / (1 + np.exp(-np.clip(x, -25, 25)))

def yolov8_post_process(outputs, strides, conf_thresh, nms_thresh):
    all_boxes, all_scores, all_class_ids = [], [], []

    outputs_by_scale = {}
    for out in outputs:
        h = out.shape[2]
        stride = int(MODEL_INPUT_SIZE / h)
        if stride not in outputs_by_scale:
            outputs_by_scale[stride] = {}
        
        channels = out.shape[1]
        if channels == (REG_MAX * 4):
            outputs_by_scale[stride]['reg'] = out
        elif channels == NUM_CLASSES:
            outputs_by_scale[stride]['cls'] = out
        elif channels == 1:
            outputs_by_scale[stride]['obj'] = out

    for stride in strides:
        if stride not in outputs_by_scale or 'reg' not in outputs_by_scale[stride] or 'cls' not in outputs_by_scale[stride] or 'obj' not in outputs_by_scale[stride]:
            continue
        
        reg_tensor = outputs_by_scale[stride]['reg']
        cls_tensor = outputs_by_scale[stride]['cls']
        obj_tensor = outputs_by_scale[stride]['obj']
        h, w = reg_tensor.shape[2], reg_tensor.shape[3]

        reg_preds = reg_tensor.squeeze(0).transpose(1, 2, 0).reshape(-1, 4, REG_MAX)
        cls_preds = cls_tensor.squeeze(0).transpose(1, 2, 0).reshape(-1, NUM_CLASSES)
        obj_preds = obj_tensor.squeeze(0).transpose(1, 2, 0).flatten()

        dist_reg = np.arange(REG_MAX, dtype=np.float32)
        e_x_reg = np.exp(reg_preds - np.max(reg_preds, axis=-1, keepdims=True))
        reg_probs = e_x_reg / e_x_reg.sum(axis=-1, keepdims=True)
        ltrb_offsets = np.sum(reg_probs * dist_reg, axis=-1)

        # <--- 关键修正点: 对类别logits使用Sigmoid，这在YOLOv8的推理中是标准做法
        cls_scores = _sigmoid(cls_preds)
        
        obj_scores = _sigmoid(obj_preds)
        
        final_scores = obj_scores[:, np.newaxis] * cls_scores
        
        confidences = np.max(final_scores, axis=1)
        mask = confidences > conf_thresh
        
        if not np.any(mask):
            continue

        class_ids = np.argmax(final_scores, axis=1)

        grid_y, grid_x = np.mgrid[0:h, 0:w]
        anchor_points_x = (grid_x.flatten() + 0.5) * stride
        anchor_points_y = (grid_y.flatten() + 0.5) * stride

        kept_ltrb = ltrb_offsets[mask]
        kept_anchors_x = anchor_points_x[mask]
        kept_anchors_y = anchor_points_y[mask]

        x1 = kept_anchors_x - kept_ltrb[:, 0] * stride
        y1 = kept_anchors_y - kept_ltrb[:, 1] * stride
        x2 = kept_anchors_x + kept_ltrb[:, 2] * stride
        y2 = kept_anchors_y + kept_ltrb[:, 3] * stride
        
        all_boxes.append(np.stack([x1, y1, x2, y2], axis=-1))
        all_scores.append(confidences[mask])
        all_class_ids.append(class_ids[mask])

    if not all_boxes:
        return None, None, None

    boxes_before_nms = np.concatenate(all_boxes, axis=0)
    scores_before_nms = np.concatenate(all_scores, axis=0)
    class_ids_before_nms = np.concatenate(all_class_ids, axis=0)

    final_boxes, final_scores, final_class_ids = [], [], []
    unique_class_ids = np.unique(class_ids_before_nms)
    
    for class_id in unique_class_ids:
        class_mask = (class_ids_before_nms == class_id)
        
        class_boxes = boxes_before_nms[class_mask]
        class_scores = scores_before_nms[class_mask]
        
        indices = cv2.dnn.NMSBoxes(class_boxes.tolist(), class_scores.tolist(), conf_thresh, nms_thresh)
        
        if isinstance(indices, np.ndarray):
            indices = indices.flatten()
            final_boxes.append(class_boxes[indices])
            final_scores.append(class_scores[indices])
            final_class_ids.append(np.full(len(indices), class_id))

    if not final_boxes:
        return None, None, None

    return np.concatenate(final_boxes), np.concatenate(final_scores), np.concatenate(final_class_ids)

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
        rospy.loginfo("Yolo detector node started. Press 'q' in the result window to quit.")
        frame_count = 0 
        strides = [8, 16, 32]

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
            img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
            
            img_4d = np.expand_dims(img_rgb, axis=0)
            img_nchw = img_4d.transpose(0, 3, 1, 2)
            
            outputs = self.rknn_lite.inference(inputs=[img_nchw])
            
            if outputs and len(outputs) >= 3:
                if frame_count == 0:
                    print("--- Model Output Shapes ---")
                    for i, out in enumerate(outputs):
                        print(f"DEBUG: Output tensor {i} shape: {out.shape}")
                    print("---------------------------")
                
                boxes, scores, class_ids = yolov8_post_process(outputs, strides, CONF_THRESHOLD, NMS_THRESHOLD)
            else:
                boxes, scores, class_ids = (None, None, None)
            
            frame_count += 1

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
                rospy.logwarn(f"ALARM: {ALARM_CLASS_NAME} DETECTED")
            elif not fall_detected and self.is_alarm_playing:
                if self.alarm_sound: self.alarm_sound.stop()
                self.is_alarm_playing = False

            if self.is_alarm_playing:
                cv2.putText(frame, f"{ALARM_CLASS_NAME.upper()} DETECTED!", (50, 80), cv2.FONT_HERSHEY_TRIPLEX, 1.5, (0,0,255), 3)

            self.result_pub.publish(self.bridge.cv2_to_imgmsg(frame, "bgr8"))
            cv2.imshow("Detection Result", frame)

            key = cv2.waitKey(1) & 0xFF
            if key == ord('q'):
                rospy.loginfo("'q' key pressed, shutting down.")
                rospy.signal_shutdown("User requested exit.")
                break

if __name__ == '__main__':
    try:
        node = YoloDetectorNode()
        node.run_inference_loop()
    except (rospy.ROSInterruptException, KeyboardInterrupt):
        rospy.loginfo("Node received shutdown signal.")
    finally:
        if 'node' in locals() and not rospy.is_shutdown():
            node.cleanup()
        rospy.loginfo("Node shutdown complete.")