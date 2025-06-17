#ifndef _ROS_SERVICE_AnalogRead_h
#define _ROS_SERVICE_AnalogRead_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace ros_arduino_msgs
{

static const char ANALOGREAD[] = "ros_arduino_msgs/AnalogRead";

  class AnalogReadRequest : public ros::Msg
  {
    public:
      typedef uint8_t _pin_type;
      _pin_type pin;

    AnalogReadRequest():
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

    virtual const char * getType() override { return ANALOGREAD; };
    virtual const char * getMD5() override { return "41386d6ac585eedbab7b4d4f9192cbcc"; };

  };

  class AnalogReadResponse : public ros::Msg
  {
    public:
      typedef uint16_t _value_type;
      _value_type value;

    AnalogReadResponse():
      value(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->value >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->value >> (8 * 1)) & 0xFF;
      offset += sizeof(this->value);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      this->value =  ((uint16_t) (*(inbuffer + offset)));
      this->value |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      offset += sizeof(this->value);
     return offset;
    }

    virtual const char * getType() override { return ANALOGREAD; };
    virtual const char * getMD5() override { return "6e68bf91459258a84dab807f5c768df7"; };

  };

  class AnalogRead {
    public:
    typedef AnalogReadRequest Request;
    typedef AnalogReadResponse Response;
  };

}
#endif
