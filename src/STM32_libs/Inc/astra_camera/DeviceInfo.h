#ifndef _ROS_astra_camera_DeviceInfo_h
#define _ROS_astra_camera_DeviceInfo_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "std_msgs/Header.h"

namespace astra_camera
{

  class DeviceInfo : public ros::Msg
  {
    public:
      typedef std_msgs::Header _header_type;
      _header_type header;
      typedef const char* _name_type;
      _name_type name;
      typedef int32_t _vid_type;
      _vid_type vid;
      typedef int32_t _pid_type;
      _pid_type pid;
      typedef const char* _serial_number_type;
      _serial_number_type serial_number;
      typedef const char* _firmware_version_type;
      _firmware_version_type firmware_version;
      typedef const char* _supported_min_sdk_version_type;
      _supported_min_sdk_version_type supported_min_sdk_version;
      typedef const char* _hardware_version_type;
      _hardware_version_type hardware_version;

    DeviceInfo():
      header(),
      name(""),
      vid(0),
      pid(0),
      serial_number(""),
      firmware_version(""),
      supported_min_sdk_version(""),
      hardware_version("")
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      offset += this->header.serialize(outbuffer + offset);
      uint32_t length_name = strlen(this->name);
      varToArr(outbuffer + offset, length_name);
      offset += 4;
      memcpy(outbuffer + offset, this->name, length_name);
      offset += length_name;
      union {
        int32_t real;
        uint32_t base;
      } u_vid;
      u_vid.real = this->vid;
      *(outbuffer + offset + 0) = (u_vid.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_vid.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_vid.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_vid.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->vid);
      union {
        int32_t real;
        uint32_t base;
      } u_pid;
      u_pid.real = this->pid;
      *(outbuffer + offset + 0) = (u_pid.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_pid.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_pid.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_pid.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->pid);
      uint32_t length_serial_number = strlen(this->serial_number);
      varToArr(outbuffer + offset, length_serial_number);
      offset += 4;
      memcpy(outbuffer + offset, this->serial_number, length_serial_number);
      offset += length_serial_number;
      uint32_t length_firmware_version = strlen(this->firmware_version);
      varToArr(outbuffer + offset, length_firmware_version);
      offset += 4;
      memcpy(outbuffer + offset, this->firmware_version, length_firmware_version);
      offset += length_firmware_version;
      uint32_t length_supported_min_sdk_version = strlen(this->supported_min_sdk_version);
      varToArr(outbuffer + offset, length_supported_min_sdk_version);
      offset += 4;
      memcpy(outbuffer + offset, this->supported_min_sdk_version, length_supported_min_sdk_version);
      offset += length_supported_min_sdk_version;
      uint32_t length_hardware_version = strlen(this->hardware_version);
      varToArr(outbuffer + offset, length_hardware_version);
      offset += 4;
      memcpy(outbuffer + offset, this->hardware_version, length_hardware_version);
      offset += length_hardware_version;
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      offset += this->header.deserialize(inbuffer + offset);
      uint32_t length_name;
      arrToVar(length_name, (inbuffer + offset));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_name; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_name-1]=0;
      this->name = (char *)(inbuffer + offset-1);
      offset += length_name;
      union {
        int32_t real;
        uint32_t base;
      } u_vid;
      u_vid.base = 0;
      u_vid.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_vid.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_vid.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_vid.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->vid = u_vid.real;
      offset += sizeof(this->vid);
      union {
        int32_t real;
        uint32_t base;
      } u_pid;
      u_pid.base = 0;
      u_pid.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_pid.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_pid.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_pid.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->pid = u_pid.real;
      offset += sizeof(this->pid);
      uint32_t length_serial_number;
      arrToVar(length_serial_number, (inbuffer + offset));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_serial_number; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_serial_number-1]=0;
      this->serial_number = (char *)(inbuffer + offset-1);
      offset += length_serial_number;
      uint32_t length_firmware_version;
      arrToVar(length_firmware_version, (inbuffer + offset));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_firmware_version; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_firmware_version-1]=0;
      this->firmware_version = (char *)(inbuffer + offset-1);
      offset += length_firmware_version;
      uint32_t length_supported_min_sdk_version;
      arrToVar(length_supported_min_sdk_version, (inbuffer + offset));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_supported_min_sdk_version; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_supported_min_sdk_version-1]=0;
      this->supported_min_sdk_version = (char *)(inbuffer + offset-1);
      offset += length_supported_min_sdk_version;
      uint32_t length_hardware_version;
      arrToVar(length_hardware_version, (inbuffer + offset));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_hardware_version; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_hardware_version-1]=0;
      this->hardware_version = (char *)(inbuffer + offset-1);
      offset += length_hardware_version;
     return offset;
    }

    virtual const char * getType() override { return "astra_camera/DeviceInfo"; };
    virtual const char * getMD5() override { return "f8aabac6d632dd2641eb4f5942464a66"; };

  };

}
#endif
