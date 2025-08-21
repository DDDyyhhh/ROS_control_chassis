#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import logging
import logging.config
import sys
import queue
import math
import os
import time
import numpy as np
import cv2
import pygame
import threading
import rospy
import message_filters
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from rknnlite.api import RKNNLite

# --- 修复 ROS 日志配置崩溃问题 ---
def safe_file_config(*args, **kwargs):
    try:
        logging.config.fileConfig(*args, **kwargs)
    except Exception as e:
        sys.stderr.write("--- PATCHED ---\n")
        sys.stderr.write("WARNING: An error occurred while trying to load a logging config file. Ignoring it.\n")
        sys.stderr.write(f"Error details: {e}\n")
        sys.stderr.write("--- END PATCH ---\n")
logging.config.fileConfig = safe_file_config

if 'ROSCONSOLE_CONFIG_FILE' in os.environ:
    del os.environ['ROSCONSOLE_CONFIG_FILE']

# --- 参数配置 ---
RKNN_MODEL_PATH = '/home/orangepi/catkin_ws/src/astra_camera/scripts/btst88.rknn'
MODEL_INPUT_SIZE = 640
CONF_THRESHOLD = 0.3
NMS_THRESHOLD = 0.5
ALARM_CLASS_NAME = "fall"
ALARM_AUDIO_PATH = "/home/orangepi/catkin_ws/src/astra_camera/scripts/alarm.wav"
ALARM_BOX_COLOR = (0, 0, 255)
NORMAL_BOX_COLOR = (0, 255, 0)

CLASSES = (
    "Power bank", "air conditioner", "ashtray", "brooms", "chairs", "chopsticks", "computer", "cup", "doors", "fall", "fan",
    "fruits", "green_plants", "hangers", "keyboard", "lamps", "mobile_phones", "mops", "mouse", "pen", "people", "refrigerator",
    "rice cooker", "rubbish", "shoes", "slipper", "socks", "sofas", "tables", "teapot", "tissue", "trashcan", "vegetables", "windows"
)

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

def xywh2xyxy(x):
    y = np.copy(x)
    y[:, 0] = x[:, 0] - x[:, 2] / 2
    y[:, 1] = x[:, 1] - x[:, 3] / 2
    y[:, 2] = x[:, 0] + x[:, 2] / 2
    y[:, 3] = x[:, 1] + x[:, 3] / 2
    return y

def nms_boxes(boxes, scores, iou_threshold):
    if boxes.shape[0] == 0: return []
    x1, y1, x2, y2 = boxes[:, 0], boxes[:, 1], boxes[:, 2], boxes[:, 3]
    areas = (x2 - x1) * (y2 - y1); order = scores.argsort()[::-1]; keep = []
    while order.size > 0:
        i = order[0]; keep.append(i)
        if order.size == 1: break
        xx1 = np.maximum(x1[i], x1[order[1:]])
        yy1 = np.maximum(y1[i], y1[order[1:]])
        xx2 = np.minimum(x2[i], x2[order[1:]])
        yy2 = np.minimum(y2[i], y2[order[1:]])
        w = np.maximum(0.0, xx2 - xx1)
        h = np.maximum(0.0, yy2 - yy1)
        inter = w * h; ovr = inter / (areas[i] + areas[order[1:]] - inter + 1e-5)
        inds = np.where(ovr <= iou_threshold)[0]; order = order[inds + 1]
    return np.array(keep)

def post_process_yolov8_dfl(output, conf_thres=0.25, iou_thres=0.45, num_classes=34, input_shape=640):
    pred = np.squeeze(output).T  # (8400, 38)
    box_dfl = pred[:, :16].reshape(-1, 4, 4)
    obj_conf = 1 / (1 + np.exp(-pred[:, 16]))
    cls_conf = 1 / (1 + np.exp(-pred[:, 17:]))
    proj = np.arange(4, dtype=np.float32)
    box = np.sum(box_dfl * proj, axis=2)
    cls_id = np.argmax(cls_conf, axis=1)
    cls_score = np.max(cls_conf, axis=1)
    score = obj_conf * cls_score
    mask = score >= conf_thres
    if not np.any(mask): return None, None, None
    box = box[mask]; score = score[mask]; cls_id = cls_id[mask]
    box[:, 0] = box[:, 0] - box[:, 2] / 2
    box[:, 1] = box[:, 1] - box[:, 3] / 2
    box[:, 2] = box[:, 0] + box[:, 2]
    box[:, 3] = box[:, 1] + box[:, 3]
    box *= input_shape
    keep = nms_boxes(box, score, iou_thres)
    return box[keep], score[keep], cls_id[keep]

class YoloDetectorNode:
    def __init__(self):
        rospy.init_node('yolo_detector_node', anonymous=True)
        self.image_queue = queue.Queue(maxsize=2)
        self.rknn_lite = RKNNLite()
        ret = self.rknn_lite.load_rknn(RKNN_MODEL_PATH)
        if ret != 0:
            rospy.logfatal(f"Failed to load RKNN model: {ret}")
            sys.exit(ret)
        ret = self.rknn_lite.init_runtime(core_mask=RKNNLite.NPU_CORE_0)
        if ret != 0:
            rospy.logfatal(f"RKNN runtime init failed: {ret}")
            sys.exit(ret)
        self.is_alarm_playing = False
        try:
            pygame.mixer.init()
            self.alarm_sound = pygame.mixer.Sound(ALARM_AUDIO_PATH)
        except Exception as e:
            rospy.logerr(f"Alarm sound load error: {e}")
            self.alarm_sound = None
        self.bridge = CvBridge()
        self.result_pub = rospy.Publisher('/detection/image_annotated', Image, queue_size=1)
        color_sub = message_filters.Subscriber('/camera/color/image_raw', Image)
        depth_sub = message_filters.Subscriber('/camera/aligned_depth_to_color/image_raw', Image)
        self.ts = message_filters.ApproximateTimeSynchronizer([color_sub, depth_sub], 10, 0.1)
        self.ts.registerCallback(self.image_callback_producer)
        rospy.on_shutdown(self.cleanup)

    def cleanup(self):
        if self.alarm_sound and self.is_alarm_playing:
            self.alarm_sound.stop()
        if pygame.get_init():
            pygame.mixer.quit()
        self.rknn_lite.release()
        cv2.destroyAllWindows()

    def image_callback_producer(self, color_msg, depth_msg):
        if self.image_queue.full(): self.image_queue.get_nowait()
        self.image_queue.put((color_msg, depth_msg), block=False)

    def run_inference_loop(self):
        while not rospy.is_shutdown():
            try:
                color_msg, depth_msg = self.image_queue.get(timeout=1.0)
                frame = self.bridge.imgmsg_to_cv2(color_msg, "bgr8")
            except: continue
            h, w = frame.shape[:2]
            img, ratio, (dw, dh) = letterbox(frame, (MODEL_INPUT_SIZE, MODEL_INPUT_SIZE))
            img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
            img_nchw = np.expand_dims(img_rgb, 0).transpose(0, 3, 1, 2)
            outputs = self.rknn_lite.inference(inputs=[img_nchw])
            if outputs and len(outputs) > 0:
                boxes, scores, class_ids = post_process_yolov8_dfl(outputs[0], CONF_THRESHOLD, NMS_THRESHOLD, num_classes=len(CLASSES))
            else:
                boxes, scores, class_ids = None, None, None
            fall_detected = False
            if boxes is not None:
                boxes[:, [0, 2]] -= dw; boxes[:, [1, 3]] -= dh; boxes /= ratio[0]
                boxes[:, [0, 2]] = np.clip(boxes[:, [0, 2]], 0, w)
                boxes[:, [1, 3]] = np.clip(boxes[:, [1, 3]], 0, h)
                for i in range(len(boxes)):
                    x1, y1, x2, y2 = boxes[i].astype(int)
                    cls_id = int(class_ids[i])
                    label = CLASSES[cls_id] if cls_id < len(CLASSES) else f"ClassID:{cls_id}"
                    color = ALARM_BOX_COLOR if label == ALARM_CLASS_NAME else NORMAL_BOX_COLOR
                    if label == ALARM_CLASS_NAME: fall_detected = True
                    cv2.rectangle(frame, (x1, y1), (x2, y2), color, 2)
                    cv2.putText(frame, f"{label} {scores[i]:.2f}", (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.6, color, 2)
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
            if cv2.waitKey(1) & 0xFF == ord('q'):
                rospy.signal_shutdown("User exit")
                break

if __name__ == '__main__':
    try:
        node = YoloDetectorNode()
        node.run_inference_loop()
    except (rospy.ROSInterruptException, KeyboardInterrupt):
        rospy.loginfo("Node exit")