# Install script for directory: /home/orangepi/catkin_ws/src/octomap/octomap

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/orangepi/catkin_ws/devel")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/octomap" TYPE FILE FILES
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/AbstractOcTree.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/AbstractOccupancyOcTree.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/ColorOcTree.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/CountingOcTree.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/MCTables.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/MapCollection.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/MapCollection.hxx"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/MapNode.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/MapNode.hxx"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/OcTree.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/OcTreeBase.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/OcTreeBaseImpl.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/OcTreeBaseImpl.hxx"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/OcTreeDataNode.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/OcTreeDataNode.hxx"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/OcTreeIterator.hxx"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/OcTreeKey.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/OcTreeNode.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/OcTreeStamped.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/OccupancyOcTreeBase.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/OccupancyOcTreeBase.hxx"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/Pointcloud.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/ScanGraph.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/octomap.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/octomap_deprecated.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/octomap_timing.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/octomap_types.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/octomap_utils.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/octomap/math" TYPE FILE FILES
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/math/Pose6D.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/math/Quaternion.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/math/Utils.h"
    "/home/orangepi/catkin_ws/src/octomap/octomap/include/octomap/math/Vector3.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/octomap" TYPE FILE FILES "/home/orangepi/catkin_ws/src/octomap/octomap/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/home/orangepi/catkin_ws/build/octomap/share/ament_index/resource_index/packages/octomap")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/octomap" TYPE FILE FILES
    "/home/orangepi/catkin_ws/build/octomap/InstallFiles/octomap-config.cmake"
    "/home/orangepi/catkin_ws/build/octomap/InstallFiles/octomap-config-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/orangepi/catkin_ws/build/octomap/lib/pkgconfig/octomap.pc")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/orangepi/catkin_ws/build/octomap/src/math/cmake_install.cmake")
  include("/home/orangepi/catkin_ws/build/octomap/src/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/orangepi/catkin_ws/build/octomap/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/orangepi/catkin_ws/build/octomap/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
