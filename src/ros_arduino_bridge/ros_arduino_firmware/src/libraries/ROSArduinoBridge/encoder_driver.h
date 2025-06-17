/* *************************************************************
   Encoder driver function definitions - by James Nugen
   ************************************************************ */
  
#ifndef ENCODER_DRIVER_H
#define ENCODER_DRIVER_H
   
#ifdef ARDUINO_ENC_COUNTER
  //below can be changed, but should be PORTD pins; 
  //otherwise additional changes in the code are required
  #define LEFT_ENC_PIN_A PD2  //pin 2
  #define LEFT_ENC_PIN_B PD3  //pin 3
  
  //below can be changed, but should be PORTC pins
  #define RIGHT_ENC_PIN_A PC4  //pin A4
  #define RIGHT_ENC_PIN_B PC5   //pin A5
#elif defined MY_ARDUINO_COUNTER
  // =================================================================
  //  配置 for Arduino Mega 2560
  // =================================================================
  // 这些引脚都是 Mega 上的外部中断引脚，性能极佳。
  #define LEFT_A 18   // Mega pin 18 (INT5)
  #define LEFT_B 19   // Mega pin 19 (INT4)
  #define RIGHT_A 20  // Mega pin 20 (INT3)
  #define RIGHT_B 21  // Mega pin 21 (INT2)
#endif
   
/**
 * @brief 读取指定编码器的计数值
 * @param i 编码器选择 (使用 LEFT 或 RIGHT 宏)
 * @return long 类型的编码器计数值
 */
long readEncoder(int i);

/**
 * @brief 重置指定编码器的计数值为0
 * @param i 编码器选择 (使用 LEFT 或 RIGHT 宏)
 */
void resetEncoder(int i);

/**
 * @brief 同时重置左右两个编码器的计数值
 */
void resetEncoders();


#endif // ENCODER_DRIVER_H