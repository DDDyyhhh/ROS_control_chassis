# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "astra_camera: 3 messages, 9 services")

set(MSG_I_FLAGS "-Iastra_camera:/home/orangepi/catkin_ws/src/astra_camera/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(astra_camera_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg" NAME_WE)
add_custom_target(_astra_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "astra_camera" "/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/Extrinsics.msg" NAME_WE)
add_custom_target(_astra_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "astra_camera" "/home/orangepi/catkin_ws/src/astra_camera/msg/Extrinsics.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/Metadata.msg" NAME_WE)
add_custom_target(_astra_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "astra_camera" "/home/orangepi/catkin_ws/src/astra_camera/msg/Metadata.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetBool.srv" NAME_WE)
add_custom_target(_astra_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "astra_camera" "/home/orangepi/catkin_ws/src/astra_camera/srv/GetBool.srv" ""
)

get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraInfo.srv" NAME_WE)
add_custom_target(_astra_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "astra_camera" "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraInfo.srv" "std_msgs/Header:sensor_msgs/RegionOfInterest:sensor_msgs/CameraInfo"
)

get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraParams.srv" NAME_WE)
add_custom_target(_astra_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "astra_camera" "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraParams.srv" ""
)

get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDeviceInfo.srv" NAME_WE)
add_custom_target(_astra_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "astra_camera" "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDeviceInfo.srv" "std_msgs/Header:astra_camera/DeviceInfo"
)

get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDouble.srv" NAME_WE)
add_custom_target(_astra_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "astra_camera" "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDouble.srv" ""
)

get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetInt32.srv" NAME_WE)
add_custom_target(_astra_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "astra_camera" "/home/orangepi/catkin_ws/src/astra_camera/srv/GetInt32.srv" ""
)

get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetString.srv" NAME_WE)
add_custom_target(_astra_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "astra_camera" "/home/orangepi/catkin_ws/src/astra_camera/srv/GetString.srv" ""
)

get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/SetInt32.srv" NAME_WE)
add_custom_target(_astra_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "astra_camera" "/home/orangepi/catkin_ws/src/astra_camera/srv/SetInt32.srv" ""
)

get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/SetString.srv" NAME_WE)
add_custom_target(_astra_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "astra_camera" "/home/orangepi/catkin_ws/src/astra_camera/srv/SetString.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
)
_generate_msg_cpp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/Extrinsics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
)
_generate_msg_cpp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/Metadata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
)

### Generating Services
_generate_srv_cpp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
)
_generate_srv_cpp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
)
_generate_srv_cpp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
)
_generate_srv_cpp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDeviceInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
)
_generate_srv_cpp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDouble.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
)
_generate_srv_cpp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
)
_generate_srv_cpp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
)
_generate_srv_cpp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/SetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
)
_generate_srv_cpp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/SetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
)

### Generating Module File
_generate_module_cpp(astra_camera
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(astra_camera_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(astra_camera_generate_messages astra_camera_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_cpp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/Extrinsics.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_cpp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/Metadata.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_cpp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetBool.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_cpp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraInfo.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_cpp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraParams.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_cpp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDeviceInfo.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_cpp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDouble.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_cpp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetInt32.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_cpp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetString.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_cpp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/SetInt32.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_cpp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/SetString.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_cpp _astra_camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(astra_camera_gencpp)
add_dependencies(astra_camera_gencpp astra_camera_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS astra_camera_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
)
_generate_msg_eus(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/Extrinsics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
)
_generate_msg_eus(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/Metadata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
)

### Generating Services
_generate_srv_eus(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
)
_generate_srv_eus(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
)
_generate_srv_eus(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
)
_generate_srv_eus(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDeviceInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
)
_generate_srv_eus(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDouble.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
)
_generate_srv_eus(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
)
_generate_srv_eus(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
)
_generate_srv_eus(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/SetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
)
_generate_srv_eus(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/SetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
)

### Generating Module File
_generate_module_eus(astra_camera
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(astra_camera_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(astra_camera_generate_messages astra_camera_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_eus _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/Extrinsics.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_eus _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/Metadata.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_eus _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetBool.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_eus _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraInfo.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_eus _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraParams.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_eus _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDeviceInfo.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_eus _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDouble.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_eus _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetInt32.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_eus _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetString.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_eus _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/SetInt32.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_eus _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/SetString.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_eus _astra_camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(astra_camera_geneus)
add_dependencies(astra_camera_geneus astra_camera_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS astra_camera_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
)
_generate_msg_lisp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/Extrinsics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
)
_generate_msg_lisp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/Metadata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
)

### Generating Services
_generate_srv_lisp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
)
_generate_srv_lisp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
)
_generate_srv_lisp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
)
_generate_srv_lisp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDeviceInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
)
_generate_srv_lisp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDouble.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
)
_generate_srv_lisp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
)
_generate_srv_lisp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
)
_generate_srv_lisp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/SetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
)
_generate_srv_lisp(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/SetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
)

### Generating Module File
_generate_module_lisp(astra_camera
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(astra_camera_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(astra_camera_generate_messages astra_camera_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_lisp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/Extrinsics.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_lisp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/Metadata.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_lisp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetBool.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_lisp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraInfo.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_lisp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraParams.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_lisp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDeviceInfo.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_lisp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDouble.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_lisp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetInt32.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_lisp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetString.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_lisp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/SetInt32.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_lisp _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/SetString.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_lisp _astra_camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(astra_camera_genlisp)
add_dependencies(astra_camera_genlisp astra_camera_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS astra_camera_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
)
_generate_msg_nodejs(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/Extrinsics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
)
_generate_msg_nodejs(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/Metadata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
)

### Generating Services
_generate_srv_nodejs(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
)
_generate_srv_nodejs(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
)
_generate_srv_nodejs(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
)
_generate_srv_nodejs(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDeviceInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
)
_generate_srv_nodejs(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDouble.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
)
_generate_srv_nodejs(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
)
_generate_srv_nodejs(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
)
_generate_srv_nodejs(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/SetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
)
_generate_srv_nodejs(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/SetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
)

### Generating Module File
_generate_module_nodejs(astra_camera
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(astra_camera_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(astra_camera_generate_messages astra_camera_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_nodejs _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/Extrinsics.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_nodejs _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/Metadata.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_nodejs _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetBool.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_nodejs _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraInfo.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_nodejs _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraParams.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_nodejs _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDeviceInfo.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_nodejs _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDouble.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_nodejs _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetInt32.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_nodejs _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetString.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_nodejs _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/SetInt32.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_nodejs _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/SetString.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_nodejs _astra_camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(astra_camera_gennodejs)
add_dependencies(astra_camera_gennodejs astra_camera_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS astra_camera_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
)
_generate_msg_py(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/Extrinsics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
)
_generate_msg_py(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/msg/Metadata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
)

### Generating Services
_generate_srv_py(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
)
_generate_srv_py(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
)
_generate_srv_py(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
)
_generate_srv_py(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDeviceInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
)
_generate_srv_py(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDouble.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
)
_generate_srv_py(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
)
_generate_srv_py(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/GetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
)
_generate_srv_py(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/SetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
)
_generate_srv_py(astra_camera
  "/home/orangepi/catkin_ws/src/astra_camera/srv/SetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
)

### Generating Module File
_generate_module_py(astra_camera
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(astra_camera_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(astra_camera_generate_messages astra_camera_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/DeviceInfo.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_py _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/Extrinsics.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_py _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/msg/Metadata.msg" NAME_WE)
add_dependencies(astra_camera_generate_messages_py _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetBool.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_py _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraInfo.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_py _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetCameraParams.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_py _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDeviceInfo.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_py _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetDouble.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_py _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetInt32.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_py _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/GetString.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_py _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/SetInt32.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_py _astra_camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orangepi/catkin_ws/src/astra_camera/srv/SetString.srv" NAME_WE)
add_dependencies(astra_camera_generate_messages_py _astra_camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(astra_camera_genpy)
add_dependencies(astra_camera_genpy astra_camera_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS astra_camera_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/astra_camera
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(astra_camera_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(astra_camera_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/astra_camera
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(astra_camera_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(astra_camera_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/astra_camera
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(astra_camera_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(astra_camera_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/astra_camera
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(astra_camera_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(astra_camera_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/astra_camera
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(astra_camera_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(astra_camera_generate_messages_py sensor_msgs_generate_messages_py)
endif()
