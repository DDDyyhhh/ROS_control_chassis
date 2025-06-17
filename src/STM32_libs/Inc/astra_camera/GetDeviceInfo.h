#ifndef _ROS_SERVICE_GetDeviceInfo_h
#define _ROS_SERVICE_GetDeviceInfo_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "astra_camera/DeviceInfo.h"

namespace astra_camera
{

static const char GETDEVICEINFO[] = "astra_camera/GetDeviceInfo";

  class GetDeviceInfoRequest : public ros::Msg
  {
    public:

    GetDeviceInfoRequest()
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

    virtual const char * getType() override { return GETDEVICEINFO; };
    virtual const char * getMD5() override { return "d41d8cd98f00b204e9800998ecf8427e"; };

  };

  class GetDeviceInfoResponse : public ros::Msg
  {
    public:
      typedef astra_camera::DeviceInfo _info_type;
      _info_type info;
      typedef bool _success_type;
      _success_type success;
      typedef const char* _message_type;
      _message_type message;

    GetDeviceInfoResponse():
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

    virtual const char * getType() override { return GETDEVICEINFO; };
    virtual const char * getMD5() override { return "1e369ba84c0330473501a0820257661a"; };

  };

  class GetDeviceInfo {
    public:
    typedef GetDeviceInfoRequest Request;
    typedef GetDeviceInfoResponse Response;
  };

}
#endif
