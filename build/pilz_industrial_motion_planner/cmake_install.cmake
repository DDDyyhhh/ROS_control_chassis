# Install script for directory: /home/orangepi/catkin_ws/src/moveit/moveit_planners/pilz_industrial_motion_planner

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/orangepi/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
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
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orangepi/catkin_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/orangepi/catkin_ws/install" TYPE PROGRAM FILES "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/_setup_util.py")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orangepi/catkin_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/orangepi/catkin_ws/install" TYPE PROGRAM FILES "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/env.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orangepi/catkin_ws/install/setup.bash;/home/orangepi/catkin_ws/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/orangepi/catkin_ws/install" TYPE FILE FILES
    "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/setup.bash"
    "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/local_setup.bash"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orangepi/catkin_ws/install/setup.sh;/home/orangepi/catkin_ws/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/orangepi/catkin_ws/install" TYPE FILE FILES
    "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/setup.sh"
    "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/local_setup.sh"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orangepi/catkin_ws/install/setup.zsh;/home/orangepi/catkin_ws/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/orangepi/catkin_ws/install" TYPE FILE FILES
    "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/setup.zsh"
    "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orangepi/catkin_ws/install/setup.fish;/home/orangepi/catkin_ws/install/local_setup.fish")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/orangepi/catkin_ws/install" TYPE FILE FILES
    "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/setup.fish"
    "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/local_setup.fish"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orangepi/catkin_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/orangepi/catkin_ws/install" TYPE FILE FILES "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/.rosinstall")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/pilz_industrial_motion_planner.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pilz_industrial_motion_planner/cmake" TYPE FILE FILES
    "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/pilz_industrial_motion_plannerConfig.cmake"
    "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/catkin_generated/installspace/pilz_industrial_motion_plannerConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pilz_industrial_motion_planner" TYPE FILE FILES "/home/orangepi/catkin_ws/src/moveit/moveit_planners/pilz_industrial_motion_planner/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pilz_industrial_motion_planner/plugins" TYPE FILE FILES
    "/home/orangepi/catkin_ws/src/moveit/moveit_planners/pilz_industrial_motion_planner/plugins/sequence_capability_plugin_description.xml"
    "/home/orangepi/catkin_ws/src/moveit/moveit_planners/pilz_industrial_motion_planner/plugins/pilz_industrial_motion_planner_plugin_description.xml"
    "/home/orangepi/catkin_ws/src/moveit/moveit_planners/pilz_industrial_motion_planner/plugins/planning_context_plugin_description.xml"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpilz_industrial_motion_planner.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpilz_industrial_motion_planner.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpilz_industrial_motion_planner.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/orangepi/catkin_ws/devel/.private/pilz_industrial_motion_planner/lib/libpilz_industrial_motion_planner.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpilz_industrial_motion_planner.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpilz_industrial_motion_planner.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpilz_industrial_motion_planner.so"
         OLD_RPATH "/home/orangepi/catkin_ws/devel/.private/moveit_ros_planning_interface/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_warehouse/lib:/home/orangepi/catkin_ws/devel/lib:/opt/ros/noetic/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_manipulation/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_move_group/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_planning/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/orangepi/catkin_ws/devel/.private/moveit_core/lib:/usr/local/lib:/home/orangepi/catkin_ws/devel/.private/srdfdom/lib:/home/orangepi/catkin_ws/devel/.private/geometric_shapes/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpilz_industrial_motion_planner.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_ptp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_ptp.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_ptp.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/orangepi/catkin_ws/devel/.private/pilz_industrial_motion_planner/lib/libplanning_context_loader_ptp.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_ptp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_ptp.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_ptp.so"
         OLD_RPATH "/home/orangepi/catkin_ws/devel/.private/moveit_ros_planning_interface/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_warehouse/lib:/home/orangepi/catkin_ws/devel/lib:/opt/ros/noetic/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_manipulation/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_move_group/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_planning/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/orangepi/catkin_ws/devel/.private/moveit_core/lib:/usr/local/lib:/home/orangepi/catkin_ws/devel/.private/srdfdom/lib:/home/orangepi/catkin_ws/devel/.private/geometric_shapes/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_ptp.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_lin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_lin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_lin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/orangepi/catkin_ws/devel/.private/pilz_industrial_motion_planner/lib/libplanning_context_loader_lin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_lin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_lin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_lin.so"
         OLD_RPATH "/home/orangepi/catkin_ws/devel/.private/moveit_ros_planning_interface/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_warehouse/lib:/home/orangepi/catkin_ws/devel/lib:/opt/ros/noetic/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_manipulation/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_move_group/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_planning/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/orangepi/catkin_ws/devel/.private/moveit_core/lib:/usr/local/lib:/home/orangepi/catkin_ws/devel/.private/srdfdom/lib:/home/orangepi/catkin_ws/devel/.private/geometric_shapes/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_lin.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_circ.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_circ.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_circ.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/orangepi/catkin_ws/devel/.private/pilz_industrial_motion_planner/lib/libplanning_context_loader_circ.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_circ.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_circ.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_circ.so"
         OLD_RPATH "/home/orangepi/catkin_ws/devel/.private/moveit_ros_planning_interface/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_warehouse/lib:/home/orangepi/catkin_ws/devel/lib:/opt/ros/noetic/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_manipulation/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_move_group/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_planning/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/orangepi/catkin_ws/devel/.private/moveit_core/lib:/usr/local/lib:/home/orangepi/catkin_ws/devel/.private/srdfdom/lib:/home/orangepi/catkin_ws/devel/.private/geometric_shapes/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libplanning_context_loader_circ.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcommand_list_manager.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcommand_list_manager.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcommand_list_manager.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/orangepi/catkin_ws/devel/.private/pilz_industrial_motion_planner/lib/libcommand_list_manager.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcommand_list_manager.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcommand_list_manager.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcommand_list_manager.so"
         OLD_RPATH "/home/orangepi/catkin_ws/devel/.private/moveit_ros_planning_interface/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_warehouse/lib:/home/orangepi/catkin_ws/devel/lib:/opt/ros/noetic/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_manipulation/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_move_group/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_planning/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/orangepi/catkin_ws/devel/.private/moveit_core/lib:/usr/local/lib:/home/orangepi/catkin_ws/devel/.private/srdfdom/lib:/home/orangepi/catkin_ws/devel/.private/geometric_shapes/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcommand_list_manager.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsequence_capability.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsequence_capability.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsequence_capability.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/orangepi/catkin_ws/devel/.private/pilz_industrial_motion_planner/lib/libsequence_capability.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsequence_capability.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsequence_capability.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsequence_capability.so"
         OLD_RPATH "/home/orangepi/catkin_ws/devel/.private/moveit_ros_planning_interface/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_warehouse/lib:/home/orangepi/catkin_ws/devel/lib:/opt/ros/noetic/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_manipulation/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_move_group/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_planning/lib:/home/orangepi/catkin_ws/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/orangepi/catkin_ws/devel/.private/moveit_core/lib:/usr/local/lib:/home/orangepi/catkin_ws/devel/.private/srdfdom/lib:/home/orangepi/catkin_ws/devel/.private/geometric_shapes/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsequence_capability.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/gtest/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/install_local_manifest.txt"
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
  file(WRITE "/home/orangepi/catkin_ws/build/pilz_industrial_motion_planner/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
