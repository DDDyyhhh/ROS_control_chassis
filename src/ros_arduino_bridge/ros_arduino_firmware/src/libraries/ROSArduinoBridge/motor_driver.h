/***************************************************************
   Motor driver function definitions - by James Nugen
   *************************************************************/

// #ifdef L298_MOTOR_DRIVER
//   #define RIGHT_MOTOR_BACKWARD 5
//   #define LEFT_MOTOR_BACKWARD  6
//   #define RIGHT_MOTOR_FORWARD  9
//   #define LEFT_MOTOR_FORWARD   10
//   #define RIGHT_MOTOR_ENABLE 12
//   #define LEFT_MOTOR_ENABLE 13
// #elif defined L298P_MOTOR_DRIVER
//   #define DIRA 7
//   #define PWMA 5
//   #define DIRB 2
//   #define PWMB 6
// #endif

// void initMotorController();
// void setMotorSpeed(int i, int spd);
// void setMotorSpeeds(int leftSpeed, int rightSpeed);

//-----------------------------------------------------------------


/***************************************************************
 * motor_driver.h
 *
 * Header file for the TB6612FNG motor driver.
 * Defines pin assignments and function prototypes for motor control.
 ***************************************************************/

#ifndef MOTOR_DRIVER_H
#define MOTOR_DRIVER_H

#include <Arduino.h>

// --- TB6612FNG Pin Definitions ---
// 为 TB6612 定义引脚
  // !! 重要：请根据你自己的硬件接线修改下面的引脚号 !!
  // #define LEFT_MOTOR_IN1  4  // AIN1
  // #define LEFT_MOTOR_IN2  3  // AIN2
  // #define LEFT_MOTOR_PWM  2  // PWMA - 必须是PWM引脚

  // #define RIGHT_MOTOR_IN1 9  // BIN1
  // #define RIGHT_MOTOR_IN2 10  // BIN2
  // #define RIGHT_MOTOR_PWM 11  // PWMB - 必须是PWM引脚

  // #define MOTOR_STBY      8  // STBY - 必须为HIGH才能让驱动器工作

// // Standby Pin - 必须为高电平才能让驱动器工作
// #define MOTOR_STBY      9  // STBY

/**
 * @brief 初始化电机控制器
 * 1. 设置所有电机引脚为OUTPUT模式.
 * 2. 激活电机驱动 (将STBY引脚设为HIGH).
 */
void initMotorController();

/** 
 * @brief 设置左右两个电机的速度和方向
 * @param leftSpeed 左轮速度, 范围 -255 到 255.
 *                  正数: 前进
 *                  负数: 后退
 *                  0: 刹车
 * @param rightSpeed 右轮速度, 范围 -255 到 255.
 */
void setMotorSpeeds(int leftSpeed, int rightSpeed);

#endif // MOTOR_DRIVER_H