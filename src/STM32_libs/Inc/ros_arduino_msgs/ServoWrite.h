#ifndef _ROS_SERVICE_ServoWrite_h
#define _ROS_SERVICE_ServoWrite_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace ros_arduino_msgs
{

static const char SERVOWRITE[] = "ros_arduino_msgs/ServoWrite";

  class ServoWriteRequest : public ros::Msg
  {
    public:
      typedef uint8_t _id_type;
      _id_type id;
      typedef float _value_type;
      _value_type value;

    ServoWriteRequest():
      id(0),
      value(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->id >> (8 * 0)) & 0xFF;
      offset += sizeof(this->id);
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
      this->id =  ((uint8_t) (*(inbuffer + offset)));
      offset += sizeof(this->id);
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

    virtual const char * getType() override { return SERVOWRITE; };
    virtual const char * getMD5() override { return "f90a4a27fdac2d3886d60d19d2b742b2"; };

  };

  class ServoWriteResponse : public ros::Msg
  {
    public:

    ServoWriteResponse()
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

    virtual const char * getType() override { return SERVOWRITE; };
    virtual const char * getMD5() override { return "d41d8cd98f00b204e9800998ecf8427e"; };

  };

  class ServoWrite {
    public:
    typedef ServoWriteRequest Request;
    typedef ServoWriteResponse Response;
  };

}
#endif
