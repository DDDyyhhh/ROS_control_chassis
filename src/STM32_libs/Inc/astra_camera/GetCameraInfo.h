#ifndef _ROS_SERVICE_GetCameraInfo_h
#define _ROS_SERVICE_GetCameraInfo_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "sensor_msgs/CameraInfo.h"

namespace astra_camera
{

static const char GETCAMERAINFO[] = "astra_camera/GetCameraInfo";

  class GetCameraInfoRequest : public ros::Msg
  {
    public:

    GetCameraInfoRequest()
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

    virtual const char * getType() override { return GETCAMERAINFO; };
    virtual const char * getMD5() override { return "d41d8cd98f00b204e9800998ecf8427e"; };

  };

  class GetCameraInfoResponse : public ros::Msg
  {
    public:
      typedef sensor_msgs::CameraInfo _info_type;
      _info_type info;
      typedef bool _success_type;
      _success_type success;
      typedef const char* _message_type;
      _message_type message;

    GetCameraInfoResponse():
      info(),
      success(0),
      message("")
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      offset += this->info.serialize(outbuffer + offset);
      union {
        bool real;
        uint8_t base;
      } u_success;
      u_success.real = this->success;
      *(outbuffer + offset + 0) = (u_success.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->success);
      uint32_t length_message = strlen(this->message);
      varToArr(outbuffer + offset, length_message);
      offset += 4;
      memcpy(outbuffer + offset, this->message, length_message);
      offset += length_message;
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      offset += this->info.deserialize(inbuffer + offset);
      union {
        bool real;
        uint8_t base;
      } u_success;
      u_success.base = 0;
      u_success.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->success = u_success.real;
      offset += sizeof(this->success);
      uint32_t length_message;
      arrToVar(length_message, (inbuffer + offset));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_message; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_message-1]=0;
      this->message = (char *)(inbuffer + offset-1);
      offset += length_message;
     return offset;
    }

    virtual const char * getType() override { return GETCAMERAINFO; };
    virtual const char * getMD5() override { return "aacf7dfed1a501be45f34981291a5579"; };

  };

  class GetCameraInfo {
    public:
    typedef GetCameraInfoRequest Request;
    typedef GetCameraInfoResponse Response;
  };

}
#endif
