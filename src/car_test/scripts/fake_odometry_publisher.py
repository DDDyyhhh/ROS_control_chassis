#!/usr/bin/env python3
# -*- coding: utf-8 -*-  

import rospy
import tf
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Point, Pose, Quaternion, Twist, Vector3
import math

rospy.init_node('odometry_publisher')

odom_pub = rospy.Publisher("odom", Odometry, queue_size=50)
odom_broadcaster = tf.TransformBroadcaster()

x = 0.0
y = 0.0
th = 0.0

vx = 0.0
vy = 0.0 # 通常2D机器人vy为0
vth = 0.0

current_time = rospy.Time.now()
last_time = rospy.Time.now()

def cmd_vel_callback(msg):
    global vx, vth
    vx = msg.linear.x
    vth = msg.angular.z

rospy.Subscriber("cmd_vel", Twist, cmd_vel_callback)

r = rospy.Rate(20.0) # 20 Hz
while not rospy.is_shutdown():
    current_time = rospy.Time.now()

    dt = (current_time - last_time).to_sec()
    delta_x = (vx * math.cos(th)) * dt
    delta_y = (vx * math.sin(th)) * dt
    delta_th = vth * dt

    x += delta_x
    y += delta_y
    th += delta_th

    # Since all odometry is 6DOF we'll need a quaternion created from yaw
    odom_quat = tf.transformations.quaternion_from_euler(0, 0, th)

    # First, we'll publish the transform over tf
    odom_broadcaster.sendTransform(
        (x, y, 0.),
        odom_quat,
        current_time,
        "base_footprint", # child frame
        "odom"          # parent frame
    )

    # Next, we'll publish the odometry message over ROS
    odom = Odometry()
    odom.header.stamp = current_time
    odom.header.frame_id = "odom"

    # Set the position
    odom.pose.pose = Pose(Point(x, y, 0.), Quaternion(*odom_quat))

    # Set the velocity
    odom.child_frame_id = "base_footprint"
    odom.twist.twist = Twist(Vector3(vx, vy, 0), Vector3(0, 0, vth))

    # Publish the message
    odom_pub.publish(odom)

    last_time = current_time
    r.sleep()