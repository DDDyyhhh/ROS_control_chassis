#ifndef _ROS_SERVICE_GetCameraParams_h
#define _ROS_SERVICE_GetCameraParams_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace astra_camera
{

static const char GETCAMERAPARAMS[] = "astra_camera/GetCameraParams";

  class GetCameraParamsRequest : public ros::Msg
  {
    public:

    GetCameraParamsRequest()
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

    virtual const char * getType() override { return GETCAMERAPARAMS; };
    virtual const char * getMD5() override { return "d41d8cd98f00b204e9800998ecf8427e"; };

  };

  class GetCameraParamsResponse : public ros::Msg
  {
    public:
      float l_intr_p[4];
      float r_intr_p[4];
      float r2l_r[9];
      float r2l_t[3];
      float l_k[5];
      float r_k[5];
      typedef bool _success_type;
      _success_type success;
      typedef const char* _message_type;
      _message_type message;

    GetCameraParamsResponse():
      l_intr_p(),
      r_intr_p(),
      r2l_r(),
      r2l_t(),
      l_k(),
      r_k(),
      success(0),
      message("")
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      for( uint32_t i = 0; i < 4; i++){
      union {
        float real;
        uint32_t base;
      } u_l_intr_pi;
      u_l_intr_pi.real = this->l_intr_p[i];
      *(outbuffer + offset + 0) = (u_l_intr_pi.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_l_intr_pi.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_l_intr_pi.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_l_intr_pi.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->l_intr_p[i]);
      }
      for( uint32_t i = 0; i < 4; i++){
      union {
        float real;
        uint32_t base;
      } u_r_intr_pi;
      u_r_intr_pi.real = this->r_intr_p[i];
      *(outbuffer + offset + 0) = (u_r_intr_pi.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_r_intr_pi.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_r_intr_pi.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_r_intr_pi.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->r_intr_p[i]);
      }
      for( uint32_t i = 0; i < 9; i++){
      union {
        float real;
        uint32_t base;
      } u_r2l_ri;
      u_r2l_ri.real = this->r2l_r[i];
      *(outbuffer + offset + 0) = (u_r2l_ri.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_r2l_ri.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_r2l_ri.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_r2l_ri.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->r2l_r[i]);
      }
      for( uint32_t i = 0; i < 3; i++){
      union {
        float real;
        uint32_t base;
      } u_r2l_ti;
      u_r2l_ti.real = this->r2l_t[i];
      *(outbuffer + offset + 0) = (u_r2l_ti.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_r2l_ti.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_r2l_ti.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_r2l_ti.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->r2l_t[i]);
      }
      for( uint32_t i = 0; i < 5; i++){
      union {
        float real;
        uint32_t base;
      } u_l_ki;
      u_l_ki.real = this->l_k[i];
      *(outbuffer + offset + 0) = (u_l_ki.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_l_ki.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_l_ki.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_l_ki.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->l_k[i]);
      }
      for( uint32_t i = 0; i < 5; i++){
      union {
        float real;
        uint32_t base;
      } u_r_ki;
      u_r_ki.real = this->r_k[i];
      *(outbuffer + offset + 0) = (u_r_ki.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_r_ki.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_r_ki.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_r_ki.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->r_k[i]);
      }
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
      for( uint32_t i = 0; i < 4; i++){
      union {
        float real;
        uint32_t base;
      } u_l_intr_pi;
      u_l_intr_pi.base = 0;
      u_l_intr_pi.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_l_intr_pi.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_l_intr_pi.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_l_intr_pi.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->l_intr_p[i] = u_l_intr_pi.real;
      offset += sizeof(this->l_intr_p[i]);
      }
      for( uint32_t i = 0; i < 4; i++){
      union {
        float real;
        uint32_t base;
      } u_r_intr_pi;
      u_r_intr_pi.base = 0;
      u_r_intr_pi.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_r_intr_pi.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_r_intr_pi.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_r_intr_pi.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->r_intr_p[i] = u_r_intr_pi.real;
      offset += sizeof(this->r_intr_p[i]);
      }
      for( uint32_t i = 0; i < 9; i++){
      union {
        float real;
        uint32_t base;
      } u_r2l_ri;
      u_r2l_ri.base = 0;
      u_r2l_ri.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_r2l_ri.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_r2l_ri.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_r2l_ri.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->r2l_r[i] = u_r2l_ri.real;
      offset += sizeof(this->r2l_r[i]);
      }
      for( uint32_t i = 0; i < 3; i++){
      union {
        float real;
        uint32_t base;
      } u_r2l_ti;
      u_r2l_ti.base = 0;
      u_r2l_ti.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_r2l_ti.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_r2l_ti.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_r2l_ti.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->r2l_t[i] = u_r2l_ti.real;
      offset += sizeof(this->r2l_t[i]);
      }
      for( uint32_t i = 0; i < 5; i++){
      union {
        float real;
        uint32_t base;
      } u_l_ki;
      u_l_ki.base = 0;
      u_l_ki.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_l_ki.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_l_ki.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_l_ki.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->l_k[i] = u_l_ki.real;
      offset += sizeof(this->l_k[i]);
      }
      for( uint32_t i = 0; i < 5; i++){
      union {
        float real;
        uint32_t base;
      } u_r_ki;
      u_r_ki.base = 0;
      u_r_ki.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_r_ki.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_r_ki.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_r_ki.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->r_k[i] = u_r_ki.real;
      offset += sizeof(this->r_k[i]);
      }
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

    virtual const char * getType() override { return GETCAMERAPARAMS; };
    virtual const char * getMD5() override { return "82a0d82977d6826869eb4772054042e0"; };

  };

  class GetCameraParams {
    public:
    typedef GetCameraParamsRequest Request;
    typedef GetCameraParamsResponse Response;
  };

}
#endif
