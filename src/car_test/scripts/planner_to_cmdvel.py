#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from quadrotor_msgs.msg import PositionCommand
import tf
import math

class PlannerController:
    def __init__(self):
        rospy.init_node('planner_controller')

        # 订阅
        rospy.Subscriber('/planning/pos_cmd', PositionCommand, self.pos_cmd_callback)
        rospy.Subscriber('/pointlio/odom', Odometry, self.odom_callback)

        # 发布
        self.cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)

        # 车辆当前状态
        self.current_pos = None
        self.current_yaw = None

        # 控制参数
        self.max_linear_vel = rospy.get_param('~max_linear_vel', 1.0) # 最大线速度
        self.max_angular_vel = rospy.get_param('~max_angular_vel', 0.8) # 最大角速度
        self.lookahead_distance = 0.5 # 简单的前视距离

    def odom_callback(self, msg):
        self.current_pos = msg.pose.pose.position
        
        # 从四元数转换到欧拉角
        orientation_q = msg.pose.pose.orientation
        orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        (roll, pitch, yaw) = tf.transformations.euler_from_quaternion(orientation_list)
        self.current_yaw = yaw

    def pos_cmd_callback(self, msg):
        if self.current_pos is None or self.current_yaw is None:
            rospy.loginfo("Waiting for current odometry...")
            return

        target_pos = msg.position
        
        # --- 核心控制逻辑 ---
        # 这是一个非常简单的比例控制，你可以替换成更高级的算法如Pure Pursuit
        
        # 1. 计算目标方向和距离
        dx = target_pos.x - self.current_pos.x
        dy = target_pos.y - self.current_pos.y
        distance_to_target = math.sqrt(dx**2 + dy**2)
        angle_to_target = math.atan2(dy, dx)
        
        # 2. 计算航向误差
        angle_error = angle_to_target - self.current_yaw
        # 归一化角度误差到[-pi, pi]
        if angle_error > math.pi:
            angle_error -= 2 * math.pi
        if angle_error < -math.pi:
            angle_error += 2 * math.pi

        # 3. 根据误差计算线速度和角速度
        # 如果角度误差太大，优先原地转向
        if abs(angle_error) > 0.8: # 约45度
            linear_vel = 0.0
            angular_vel = 1.5 * angle_error # 比例系数 P
        else:
            # 否则，同时前进和转向
            linear_vel = 0.8 * distance_to_target # 比例系数 P
            angular_vel = 1.2 * angle_error # 比例系数 P
            
        # 4. 速度限幅
        linear_vel = max(min(linear_vel, self.max_linear_vel), -self.max_linear_vel)
        angular_vel = max(min(angular_vel, self.max_angular_vel), -self.max_angular_vel)

        # 5. 发布Twist消息
        cmd_vel_msg = Twist()
        cmd_vel_msg.linear.x = linear_vel
        cmd_vel_msg.angular.z = angular_vel
        self.cmd_vel_pub.publish(cmd_vel_msg)

    def run(self):
        rospy.spin()

if __name__ == '__main__':
    try:
        controller = PlannerController()
        controller.run()
    except rospy.ROSInterruptException:
        pass