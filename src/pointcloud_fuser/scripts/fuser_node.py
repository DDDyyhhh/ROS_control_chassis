#!/usr/bin/env python3
# -*- coding: UTF-8 -*-

import rospy
import tf2_ros
from sensor_msgs.msg import PointCloud2
import tf2_sensor_msgs.tf2_sensor_msgs
import sys
sys.path.append('/usr/lib/python3/dist-packages')

class PointCloudFuser:
    def __init__(self):
        rospy.init_node('pointcloud_fuser_node')

        self.target_frame = 'map'
        
        # 【【【关键修改1：增加TF缓存时间】】】
        # 将缓存时间增加到30秒，足以应对LIO算法的任何处理延迟
        self.tf_buffer = tf2_ros.Buffer(rospy.Duration(30.0))
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)

        self.fused_pub = rospy.Publisher('/fused_world_pointcloud', PointCloud2, queue_size=5)
        
        # 我们不再需要 tf_ready 标志位，lookup_transform 自带等待机制
        
        self.raw_cloud_sub = rospy.Subscriber('/unilidar/cloud', PointCloud2, self.cloud_callback, queue_size=5)
        
        rospy.loginfo("PointCloud Fuser is running.")

    def cloud_callback(self, msg):
        try:
            # 【【【关键修改2：使用点云自身的时间戳进行查询】】】
            # 这确保了我们用 T 时刻的位姿，去变换 T 时刻的点云
            transform = self.tf_buffer.lookup_transform(
                self.target_frame,      # 目标坐标系 'map'
                msg.header.frame_id,    # 源坐标系 'unilidar_lidar'
                msg.header.stamp,       # 【重要】使用点云的原始时间戳
                rospy.Duration(0.2)     # 【重要】给TF查询0.2秒的等待时间
            )
            
            # 使用查询到的精确时刻的TF进行变换
            cloud_out = tf2_sensor_msgs.do_transform_cloud(msg, transform)
            
            # 发布融合后的点云
            self.fused_pub.publish(cloud_out)

        except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException) as e:
            # 只有在0.2秒超时后依然找不到TF时，才会打印警告
            rospy.logwarn_throttle(2.0, "Failed to transform point cloud. Is the LIO running and publishing TF? Error: %s", e)

if __name__ == '__main__':
    try:
        PointCloudFuser()
        rospy.spin()
    except rospy.ROSException:
        pass