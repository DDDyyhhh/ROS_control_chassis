// Generated by gencpp from file lslidar_msgs/LslidarDifop.msg
// DO NOT EDIT!


#ifndef LSLIDAR_MSGS_MESSAGE_LSLIDARDIFOP_H
#define LSLIDAR_MSGS_MESSAGE_LSLIDARDIFOP_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace lslidar_msgs
{
template <class ContainerAllocator>
struct LslidarDifop_
{
  typedef LslidarDifop_<ContainerAllocator> Type;

  LslidarDifop_()
    : rpm(0)  {
    }
  LslidarDifop_(const ContainerAllocator& _alloc)
    : rpm(0)  {
  (void)_alloc;
    }



   typedef int64_t _rpm_type;
  _rpm_type rpm;





  typedef boost::shared_ptr< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> const> ConstPtr;

}; // struct LslidarDifop_

typedef ::lslidar_msgs::LslidarDifop_<std::allocator<void> > LslidarDifop;

typedef boost::shared_ptr< ::lslidar_msgs::LslidarDifop > LslidarDifopPtr;
typedef boost::shared_ptr< ::lslidar_msgs::LslidarDifop const> LslidarDifopConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::lslidar_msgs::LslidarDifop_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::lslidar_msgs::LslidarDifop_<ContainerAllocator1> & lhs, const ::lslidar_msgs::LslidarDifop_<ContainerAllocator2> & rhs)
{
  return lhs.rpm == rhs.rpm;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::lslidar_msgs::LslidarDifop_<ContainerAllocator1> & lhs, const ::lslidar_msgs::LslidarDifop_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace lslidar_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> >
{
  static const char* value()
  {
    return "50442aa210dd5f42de9c4e1b86df3045";
  }

  static const char* value(const ::lslidar_msgs::LslidarDifop_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x50442aa210dd5f42ULL;
  static const uint64_t static_value2 = 0xde9c4e1b86df3045ULL;
};

template<class ContainerAllocator>
struct DataType< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> >
{
  static const char* value()
  {
    return "lslidar_msgs/LslidarDifop";
  }

  static const char* value(const ::lslidar_msgs::LslidarDifop_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 rpm\n"
;
  }

  static const char* value(const ::lslidar_msgs::LslidarDifop_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.rpm);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LslidarDifop_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::lslidar_msgs::LslidarDifop_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::lslidar_msgs::LslidarDifop_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "rpm: ";
    Printer<int64_t>::stream(s, indent + "  ", v.rpm);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LSLIDAR_MSGS_MESSAGE_LSLIDARDIFOP_H
