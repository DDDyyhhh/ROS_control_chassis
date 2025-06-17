/***************************************************************
   Motor driver definitions
   
   Add a "#elif defined" block to this file to include support
   for a particular motor driver.  Then add the appropriate
   #define near the top of the main ROSArduinoBridge.ino file.
   
   *************************************************************/

#ifdef USE_BASE
   
#ifdef POLOLU_VNH5019
  /* Include the Pololu library */
  #include "DualVNH5019MotorShield.h"

  /* Create the motor driver object */
  DualVNH5019MotorShield drive;
  
  /* Wrap the motor driver initialization */
  void initMotorController() {
    drive.init();
  }

  /* Wrap the drive motor set speed function */
  void setMotorSpeed(int i, int spd) {
    if (i == LEFT) drive.setM1Speed(spd);
    else drive.setM2Speed(spd);
  }

  // A convenience function for setting both motor speeds
  void setMotorSpeeds(int leftSpeed, int rightSpeed) {
    setMotorSpeed(LEFT, leftSpeed);
    setMotorSpeed(RIGHT, rightSpeed);
  }
#elif defined POLOLU_MC33926
  /* Include the Pololu library */
  #include "DualMC33926MotorShield.h"

  /* Create the motor driver object */
  DualMC33926MotorShield drive;
  
  /* Wrap the motor driver initialization */
  void initMotorController() {
    drive.init();
  }

  /* Wrap the drive motor set speed function */
  void setMotorSpeed(int i, int spd) {
    if (i == LEFT) drive.setM1Speed(spd);
    else drive.setM2Speed(spd);
  }

  // A convenience function for setting both motor speeds
  void setMotorSpeeds(int leftSpeed, int rightSpeed) {
    setMotorSpeed(LEFT, leftSpeed);
    setMotorSpeed(RIGHT, rightSpeed);
  }
#elif defined L298_MOTOR_DRIVER
  void initMotorController() {
    digitalWrite(RIGHT_MOTOR_ENABLE, HIGH);
    digitalWrite(LEFT_MOTOR_ENABLE, HIGH);
  }
  
  void setMotorSpeed(int i, int spd) {
    unsigned char reverse = 0;
  
    if (spd < 0)
    {
      spd = -spd;
      reverse = 1;
    }
    if (spd > 255)
      spd = 255;
    
    if (i == LEFT) { 
      if      (reverse == 0) { analogWrite(RIGHT_MOTOR_FORWARD, spd); analogWrite(RIGHT_MOTOR_BACKWARD, 0); }
      else if (reverse == 1) { analogWrite(RIGHT_MOTOR_BACKWARD, spd); analogWrite(RIGHT_MOTOR_FORWARD, 0); }
    }
    else /*if (i == RIGHT) //no need for condition*/ {
      if      (reverse == 0) { analogWrite(LEFT_MOTOR_FORWARD, spd); analogWrite(LEFT_MOTOR_BACKWARD, 0); }
      else if (reverse == 1) { analogWrite(LEFT_MOTOR_BACKWARD, spd); analogWrite(LEFT_MOTOR_FORWARD, 0); }
    }
  }
  
  void setMotorSpeeds(int leftSpeed, int rightSpeed) {
    setMotorSpeed(LEFT, leftSpeed);
    setMotorSpeed(RIGHT, rightSpeed);
  }
#elif defined L298P_MOTOR_DRIVER
  void initMotorController() {
    pinMode(DIRA,OUTPUT);
    pinMode(PWMA,OUTPUT);
    pinMode(DIRB,OUTPUT);
    pinMode(PWMB,OUTPUT);
    pinMode(12,OUTPUT);
    pinMode(13,OUTPUT);
  }

void setMotorSpeed(int i, int spd) {
  unsigned char reverse = 0;
  
  if (spd < 0)
  {
    spd = -spd;
    reverse = 1;
  }
  if (spd > 255){
    spd = 255;
  }
  
  if (i == LEFT) {
    if(reverse == 0) {
      digitalWrite(DIRA,HIGH);
      digitalWrite(13,LOW);
      analogWrite(PWMA,spd);
    }else if (reverse == 1) {
      digitalWrite(DIRA,LOW);
      digitalWrite(13,HIGH);
      analogWrite(PWMA,spd);
    }
  }else{
    if(reverse == 1) {
      digitalWrite(DIRB,LOW);
      digitalWrite(12,HIGH);
      analogWrite(PWMB,spd);
    } else if (reverse == 0) {
      digitalWrite(DIRB,HIGH);
      digitalWrite(12,LOW);
      analogWrite(PWMB,spd);
    }
  }
}

void setMotorSpeeds(int leftSpeed, int rightSpeed) {
  setMotorSpeed(LEFT, leftSpeed);
  setMotorSpeed(RIGHT, rightSpeed);
}

// ==========================================================
//  在这里粘贴新的 TB6612 代码块
// ==========================================================
#elif defined TB6612_MOTOR_DRIVER
  // 为 TB6612 定义引脚
  // !! 重要：请根据你自己的硬件接线修改下面的引脚号 !!
  #define LEFT_MOTOR_IN1  4  // AIN1
  #define LEFT_MOTOR_IN2  3  // AIN2
  #define LEFT_MOTOR_PWM  2  // PWMA - 必须是PWM引脚

  #define RIGHT_MOTOR_IN1 9  // BIN1
  #define RIGHT_MOTOR_IN2 10  // BIN2
  #define RIGHT_MOTOR_PWM 11  // PWMB - 必须是PWM引脚

  #define MOTOR_STBY      8  // STBY - 必须为HIGH才能让驱动器工作

  // 初始化 TB6612
  void initMotorController() {
    // 设置所有电机控制引脚为输出模式
    pinMode(LEFT_MOTOR_IN1, OUTPUT);
    pinMode(LEFT_MOTOR_IN2, OUTPUT);
    pinMode(LEFT_MOTOR_PWM, OUTPUT);
    
    pinMode(RIGHT_MOTOR_IN1, OUTPUT);
    pinMode(RIGHT_MOTOR_IN2, OUTPUT);
    pinMode(RIGHT_MOTOR_PWM, OUTPUT);

    // 设置Standby引脚为输出模式并设为高电平, 激活电机驱动
    pinMode(MOTOR_STBY, OUTPUT);
    digitalWrite(MOTOR_STBY, HIGH);
  }

  // 为 TB6612 实现 setMotorSpeed 函数
  void setMotorSpeed(int i, int spd) {
    // 限制速度在 -255 到 255 之间
    int speed_abs = constrain(abs(spd), 0, 255);

    if (i == LEFT) {
      if (spd > 0) { // 前进
        digitalWrite(LEFT_MOTOR_IN1, HIGH);
        digitalWrite(LEFT_MOTOR_IN2, LOW);
      } else if (spd < 0) { // 后退
        digitalWrite(LEFT_MOTOR_IN1, LOW);
        digitalWrite(LEFT_MOTOR_IN2, HIGH);
      } else { // 刹车
        digitalWrite(LEFT_MOTOR_IN1, LOW);
        digitalWrite(LEFT_MOTOR_IN2, LOW);
      }
      analogWrite(LEFT_MOTOR_PWM, speed_abs);
    } 
    else if (i == RIGHT) {
      // 注意：如果你的右轮方向反了, 请交换下面两行的HIGH和LOW
      if (spd > 0) { // 前进
        digitalWrite(RIGHT_MOTOR_IN1, HIGH);
        digitalWrite(RIGHT_MOTOR_IN2, LOW);
      } else if (spd < 0) { // 后退
        digitalWrite(RIGHT_MOTOR_IN1, LOW);
        digitalWrite(RIGHT_MOTOR_IN2, HIGH);
      } else { // 刹车
        digitalWrite(RIGHT_MOTOR_IN1, LOW);
        digitalWrite(RIGHT_MOTOR_IN2, LOW);
      }
      analogWrite(RIGHT_MOTOR_PWM, speed_abs);
    }
  }

  // 这个函数不用改, 它会自动调用上面的 setMotorSpeed
  void setMotorSpeeds(int leftSpeed, int rightSpeed) {
    setMotorSpeed(LEFT, leftSpeed);
    setMotorSpeed(RIGHT, rightSpeed);
  }
// ==========================================================
//  新代码块结束
// ==========================================================

#else
  #error A motor driver must be selected!
#endif

#endif
