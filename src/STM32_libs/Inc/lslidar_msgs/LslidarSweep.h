#ifndef _ROS_lslidar_msgs_LslidarSweep_h
#define _ROS_lslidar_msgs_LslidarSweep_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "std_msgs/Header.h"
#include "lslidar_msgs/LslidarScan.h"

namespace lslidar_msgs
{

  class LslidarSweep : public ros::Msg
  {
    public:
      typedef std_msgs::Header _header_type;
      _header_type header;
      lslidar_msgs::LslidarScan scans[16];

    LslidarSweep():
      header(),
      scans()
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      offset += this->header.serialize(outbuffer + offset);
      for( uint32_t i = 0; i < 16; i++){
      offset += this->scans[i].serialize(outbuffer + offset);
      }
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      offset += this->header.deserialize(inbuffer + offset);
      for( uint32_t i = 0; i < 16; i++){
      offset += this->scans[i].deserialize(inbuffer + offset);
      }
     return offset;
    }

    virtual const char * getType() override { return "lslidar_msgs/LslidarSweep"; };
    virtual const char * getMD5() override { return "e0395900ded93e728803e208b8b88005"; };

  };

}
#endif
