/*********************************************************************
 *  diff_controller.h - 改进版
 *  支持左右轮独立 PID 参数
 *********************************************************************/

/* PID setpoint info For a Motor */
typedef struct {
  double TargetTicksPerFrame;    // 目标速度 (ticks/frame)
  long Encoder;                  // 当前编码器读数
  long PrevEnc;                  // 上一次的编码器读数

  int PrevInput;                 // 上一次的输入 (用于计算微分项)
  int ITerm;                     // 积分项

  long output;                   // PID计算后的输出值 (PWM)

  // ==========================================================
  //  *** 改进第1步: 将PID参数移入结构体 ***
  // ==========================================================
  float Kp;
  float Kd;
  int Ki;
  int Ko;
  // ==========================================================

} SetPointInfo;

SetPointInfo leftPID, rightPID;

// 全局变量 "moving" 依然需要
unsigned char moving = 0; // 机器人是否在运动?

/*
* 初始化 PID 变量
*/
void resetPID(){
   // --- 初始化左轮PID ---
   leftPID.TargetTicksPerFrame = 0.0;
   leftPID.Encoder = readEncoder(LEFT);
   leftPID.PrevEnc = leftPID.Encoder;
   leftPID.output = 0;
   leftPID.PrevInput = 0;
   leftPID.ITerm = 0;
   
   // ==========================================================
   //  *** 改进第2步: 在这里为左右轮设置独立的默认PID参数 ***
   // ==========================================================
   // 为左轮设置默认参数
   leftPID.Kp = 6.9; // 初始值
   leftPID.Kd = 0.0;
   leftPID.Ki = 0;
   leftPID.Ko = 50;

   // --- 初始化右轮PID ---
   rightPID.TargetTicksPerFrame = 0.0;
   rightPID.Encoder = readEncoder(RIGHT);
   rightPID.PrevEnc = rightPID.Encoder;
   rightPID.output = 0;
   rightPID.PrevInput = 0;
   rightPID.ITerm = 0;

   // 为右轮设置默认参数 (可以先和左轮保持一致, 然后再分别微调)
   rightPID.Kp = 7.5; // 初始值
   rightPID.Kd = 0.0;
   rightPID.Ki = 0;
   rightPID.Ko = 50;
   // ==========================================================
}

/* 核心PID计算程序 */
void doPID(SetPointInfo * p) {
  long Perror;
  long output;
  int input;

  input = p->Encoder - p->PrevEnc;
  Perror = p->TargetTicksPerFrame - input;


  //===================打印参数=========================
  // 1. 打印 Y 轴的下边界
// Serial.print(0); 
// Serial.print(" "); // 用空格隔开

// // 2. 打印 Y 轴的上边界 (对于PWM值来说，255是最大值)
// Serial.print(255);
// Serial.print(" "); // 用空格隔开

// // 3. 打印您真正想看的真实数据 (例如左轮的PWM输出)
// //Serial.println(input); // 在这个库里, PrevInput 存放的是最终的PWM输出
// Serial.println(input);
//Serial.print(rightPID.PrevInput); // 在这个库里, PrevInput 存放的是最终的PWM输出

  // ==========================================================
  //  *** 改进第3步: 使用结构体内部的PID参数进行计算 ***
  //  将原来的 Kp, Kd, Ki, Ko 改为 p->Kp, p->Kd ...
  // ==========================================================
  output = (p->Kp * Perror - p->Kd * (input - p->PrevInput) + p->ITerm) / p->Ko;
  p->PrevEnc = p->Encoder;

  output += p->output;
  
  // 限制输出范围
  if (output >= MAX_PWM)
    output = MAX_PWM;
  else if (output <= -MAX_PWM)
    output = -MAX_PWM;
  else
    p->ITerm += p->Ki * Perror; // 只有在未饱和时才累加积分项

  p->output = output;
  p->PrevInput = input;

  // 可以在这里添加打印语句来观察独立的PID输出
  // if (p == &leftPID) {
  //   Serial.print("Left PWM: ");
  //   Serial.println(p->output);
  // }
}

/* 读取编码器并调用PID程序 */
void updatePID() {
  leftPID.Encoder = readEncoder(LEFT);
  rightPID.Encoder = readEncoder(RIGHT);
  
  if (!moving){
    if (leftPID.output != 0 || rightPID.output != 0) resetPID();
    return;
  }

  // 分别为左右轮计算PID
  doPID(&rightPID);
  doPID(&leftPID);

  // 设置电机速度
  setMotorSpeeds(leftPID.output, rightPID.output);
}