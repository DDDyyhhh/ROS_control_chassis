#ifndef _ROS_SERVICE_AnalogWrite_h
#define _ROS_SERVICE_AnalogWrite_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace ros_arduino_msgs
{

static const char ANALOGWRITE[] = "ros_arduino_msgs/AnalogWrite";

  class AnalogWriteRequest : public ros::Msg
  {
    public:
      typedef uint8_t _pin_type;
      _pin_type pin;
      typedef uint16_t _value_type;
      _value_type value;

    AnalogWriteRequest():
      pin(0),
      value(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->pin >> (8 * 0)) & 0xFF;
      offset += sizeof(this->pin);
      *(outbuffer + offset + 0) = (this->value >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->value >> (8 * 1)) & 0xFF;
      offset += sizeof(this->value);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      this->pin =  ((uint8_t) (*(inbuffer + offset)));
      offset += sizeof(this->pin);
      this->value =  ((uint16_t) (*(inbuffer + offset)));
      this->value |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      offset += sizeof(this->value);
     return offset;
    }

    virtual const char * getType() override { return ANALOGWRITE; };
    virtual const char * getMD5() override { return "8bdf3293d28cac28419ebc4ff41dad0d"; };

  };

  class AnalogWriteResponse : public ros::Msg
  {
    public:

    AnalogWriteResponse()
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

    virtual const char * getType() override { return ANALOGWRITE; };
    virtual const char * getMD5() override { return "d41d8cd98f00b204e9800998ecf8427e"; };

  };

  class AnalogWrite {
    public:
    typedef AnalogWriteRequest Request;
    typedef AnalogWriteResponse Response;
  };

}
#endif
