#ifndef _ROS_SERVICE_DigitalSetDirection_h
#define _ROS_SERVICE_DigitalSetDirection_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace ros_arduino_msgs
{

static const char DIGITALSETDIRECTION[] = "ros_arduino_msgs/DigitalSetDirection";

  class DigitalSetDirectionRequest : public ros::Msg
  {
    public:
      typedef uint8_t _pin_type;
      _pin_type pin;
      typedef bool _direction_type;
      _direction_type direction;

    DigitalSetDirectionRequest():
      pin(0),
      direction(0)
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
      } u_direction;
      u_direction.real = this->direction;
      *(outbuffer + offset + 0) = (u_direction.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->direction);
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
      } u_direction;
      u_direction.base = 0;
      u_direction.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->direction = u_direction.real;
      offset += sizeof(this->direction);
     return offset;
    }

    virtual const char * getType() override { return DIGITALSETDIRECTION; };
    virtual const char * getMD5() override { return "b10eff5e5e7e4623e1ee840cec92b372"; };

  };

  class DigitalSetDirectionResponse : public ros::Msg
  {
    public:

    DigitalSetDirectionResponse()
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

    virtual const char * getType() override { return DIGITALSETDIRECTION; };
    virtual const char * getMD5() override { return "d41d8cd98f00b204e9800998ecf8427e"; };

  };

  class DigitalSetDirection {
    public:
    typedef DigitalSetDirectionRequest Request;
    typedef DigitalSetDirectionResponse Response;
  };

}
#endif
