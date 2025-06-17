#ifndef _ROS_SERVICE_ServoRead_h
#define _ROS_SERVICE_ServoRead_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace ros_arduino_msgs
{

static const char SERVOREAD[] = "ros_arduino_msgs/ServoRead";

  class ServoReadRequest : public ros::Msg
  {
    public:
      typedef uint8_t _id_type;
      _id_type id;

    ServoReadRequest():
      id(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->id >> (8 * 0)) & 0xFF;
      offset += sizeof(this->id);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      this->id =  ((uint8_t) (*(inbuffer + offset)));
      offset += sizeof(this->id);
     return offset;
    }

    virtual const char * getType() override { return SERVOREAD; };
    virtual const char * getMD5() override { return "541b98e964705918fa8eb206b65347b3"; };

  };

  class ServoReadResponse : public ros::Msg
  {
    public:
      typedef float _value_type;
      _value_type value;

    ServoReadResponse():
      value(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_value;
      u_value.real = this->value;
      *(outbuffer + offset + 0) = (u_value.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_value.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_value.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_value.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->value);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_value;
      u_value.base = 0;
      u_value.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_value.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_value.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_value.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->value = u_value.real;
      offset += sizeof(this->value);
     return offset;
    }

    virtual const char * getType() override { return SERVOREAD; };
    virtual const char * getMD5() override { return "0aca93dcf6d857f0e5a0dc6be1eaa9fb"; };

  };

  class ServoRead {
    public:
    typedef ServoReadRequest Request;
    typedef ServoReadResponse Response;
  };

}
#endif
