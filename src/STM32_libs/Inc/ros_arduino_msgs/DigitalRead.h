#ifndef _ROS_SERVICE_DigitalRead_h
#define _ROS_SERVICE_DigitalRead_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace ros_arduino_msgs
{

static const char DIGITALREAD[] = "ros_arduino_msgs/DigitalRead";

  class DigitalReadRequest : public ros::Msg
  {
    public:
      typedef uint8_t _pin_type;
      _pin_type pin;

    DigitalReadRequest():
      pin(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->pin >> (8 * 0)) & 0xFF;
      offset += sizeof(this->pin);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      this->pin =  ((uint8_t) (*(inbuffer + offset)));
      offset += sizeof(this->pin);
     return offset;
    }

    virtual const char * getType() override { return DIGITALREAD; };
    virtual const char * getMD5() override { return "41386d6ac585eedbab7b4d4f9192cbcc"; };

  };

  class DigitalReadResponse : public ros::Msg
  {
    public:
      typedef bool _value_type;
      _value_type value;

    DigitalReadResponse():
      value(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        bool real;
        uint8_t base;
      } u_value;
      u_value.real = this->value;
      *(outbuffer + offset + 0) = (u_value.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->value);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        bool real;
        uint8_t base;
      } u_value;
      u_value.base = 0;
      u_value.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->value = u_value.real;
      offset += sizeof(this->value);
     return offset;
    }

    virtual const char * getType() override { return DIGITALREAD; };
    virtual const char * getMD5() override { return "e431d687bf4b2c65fbd94b12ae0cb5d9"; };

  };

  class DigitalRead {
    public:
    typedef DigitalReadRequest Request;
    typedef DigitalReadResponse Response;
  };

}
#endif
