/* Define single-letter commands that will be sent by the PC over the
   serial link.
*/

#ifndef COMMANDS_H
#define COMMANDS_H

#define ANALOG_READ    'a'
#define GET_BAUDRATE   'b'
#define PIN_MODE       'c'
#define DIGITAL_READ   'd'
#define READ_ENCODERS  'e'
#define MOTOR_SPEEDS   'm'
#define PING           'p'
#define RESET_ENCODERS 'r'
#define SERVO_WRITE    's'
#define SERVO_READ     't'
#define UPDATE_PID     'u'
#define DIGITAL_WRITE  'w'
#define ANALOG_WRITE   'x'
#define LEFT            0
#define RIGHT           1
#define LIDAR_BEGIN    'o'
#define LIDAR_END      'i'
#define UPDATE_PID_LEFT  'l'  // 使用 'l' (小写L) 来更新左轮PID
#define UPDATE_PID_RIGHT 'k'  // 使用 'd' 来更新右轮PID (因为'r'被RESET占用了)
#endif
