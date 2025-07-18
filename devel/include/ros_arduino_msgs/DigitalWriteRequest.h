// Generated by gencpp from file ros_arduino_msgs/DigitalWriteRequest.msg
// DO NOT EDIT!


#ifndef ROS_ARDUINO_MSGS_MESSAGE_DIGITALWRITEREQUEST_H
#define ROS_ARDUINO_MSGS_MESSAGE_DIGITALWRITEREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ros_arduino_msgs
{
template <class ContainerAllocator>
struct DigitalWriteRequest_
{
  typedef DigitalWriteRequest_<ContainerAllocator> Type;

  DigitalWriteRequest_()
    : pin(0)
    , value(false)  {
    }
  DigitalWriteRequest_(const ContainerAllocator& _alloc)
    : pin(0)
    , value(false)  {
  (void)_alloc;
    }



   typedef uint8_t _pin_type;
  _pin_type pin;

   typedef uint8_t _value_type;
  _value_type value;





  typedef boost::shared_ptr< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> const> ConstPtr;

}; // struct DigitalWriteRequest_

typedef ::ros_arduino_msgs::DigitalWriteRequest_<std::allocator<void> > DigitalWriteRequest;

typedef boost::shared_ptr< ::ros_arduino_msgs::DigitalWriteRequest > DigitalWriteRequestPtr;
typedef boost::shared_ptr< ::ros_arduino_msgs::DigitalWriteRequest const> DigitalWriteRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator1> & lhs, const ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator2> & rhs)
{
  return lhs.pin == rhs.pin &&
    lhs.value == rhs.value;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator1> & lhs, const ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_arduino_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9965f904e6efea32066b0a4a77246056";
  }

  static const char* value(const ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9965f904e6efea32ULL;
  static const uint64_t static_value2 = 0x066b0a4a77246056ULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_arduino_msgs/DigitalWriteRequest";
  }

  static const char* value(const ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 pin\n"
"bool value\n"
;
  }

  static const char* value(const ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pin);
      stream.next(m.value);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DigitalWriteRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_arduino_msgs::DigitalWriteRequest_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "pin: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.pin);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "value: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.value);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_ARDUINO_MSGS_MESSAGE_DIGITALWRITEREQUEST_H
