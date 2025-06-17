#ifndef _ROS_SERVICE_DigitalWrite_h
#define _ROS_SERVICE_DigitalWrite_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace ros_arduino_msgs
{

static const char DIGITALWRITE[] = "ros_arduino_msgs/DigitalWrite";

  class DigitalWriteRequest : public ros::Msg
  {
    public:
      typedef uint8_t _pin_type;
      _pin_type pin;
      typedef bool _value_type;
      _value_type value;

    DigitalWriteRequest():
      pin(0),
      value(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->pin >> (8 * 0)) & 0xFF;
      offset += sizeof(this->pin);
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
      this->pin =  ((uint8_t) (*(inbuffer + offset)));
      offset += sizeof(this->pin);
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

    virtual const char * getType() override { return DIGITALWRITE; };
    virtual const char * getMD5() override { return "9965f904e6efea32066b0a4a77246056"; };

  };

  class DigitalWriteResponse : public ros::Msg
  {
    public:

    DigitalWriteResponse()
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
     return offset;
    }

    virtual const char * getType() override { return DIGITALWRITE; };
    virtual const char * getMD5() override { return "d41d8cd98f00b204e9800998ecf8427e"; };

  };

  class DigitalWrite {
    public:
    typedef DigitalWriteRequest Request;
    typedef DigitalWriteResponse Response;
  };

}
#endif
