#ifndef _ROS_ros_arduino_msgs_Digital_h
#define _ROS_ros_arduino_msgs_Digital_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "std_msgs/Header.h"

namespace ros_arduino_msgs
{

  class Digital : public ros::Msg
  {
    public:
      typedef std_msgs::Header _header_type;
      _header_type header;
      typedef uint8_t _value_type;
      _value_type value;

    Digital():
      header(),
      value(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      offset += this->header.serialize(outbuffer + offset);
      *(outbuffer + offset + 0) = (this->value >> (8 * 0)) & 0xFF;
      offset += sizeof(this->value);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      offset += this->header.deserialize(inbuffer + offset);
      this->value =  ((uint8_t) (*(inbuffer + offset)));
      offset += sizeof(this->value);
     return offset;
    }

    virtual const char * getType() override { return "ros_arduino_msgs/Digital"; };
    virtual const char * getMD5() override { return "90539346f3c3c8fc47f159ab9a6ff208"; };

  };

}
#endif
