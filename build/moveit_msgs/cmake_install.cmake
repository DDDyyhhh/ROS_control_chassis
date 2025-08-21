# Install script for directory: /home/orangepi/catkin_ws/src/moveit_msgs

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
  file(INSTALL DESTINATION "/home/orangepi/catkin_ws/install" TYPE PROGRAM FILES "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/_setup_util.py")
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
  file(INSTALL DESTINATION "/home/orangepi/catkin_ws/install" TYPE PROGRAM FILES "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/env.sh")
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
    "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/setup.bash"
    "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/local_setup.bash"
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
    "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/setup.sh"
    "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/local_setup.sh"
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
    "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/setup.zsh"
    "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/local_setup.zsh"
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
    "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/setup.fish"
    "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/local_setup.fish"
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
  file(INSTALL DESTINATION "/home/orangepi/catkin_ws/install" TYPE FILE FILES "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/.rosinstall")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_msgs/action" TYPE FILE FILES
    "/home/orangepi/catkin_ws/src/moveit_msgs/action/ExecuteTrajectory.action"
    "/home/orangepi/catkin_ws/src/moveit_msgs/action/MoveGroup.action"
    "/home/orangepi/catkin_ws/src/moveit_msgs/action/MoveGroupSequence.action"
    "/home/orangepi/catkin_ws/src/moveit_msgs/action/Pickup.action"
    "/home/orangepi/catkin_ws/src/moveit_msgs/action/Place.action"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_msgs/msg" TYPE FILE FILES
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/ExecuteTrajectoryAction.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/ExecuteTrajectoryActionGoal.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/ExecuteTrajectoryActionResult.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/ExecuteTrajectoryActionFeedback.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/ExecuteTrajectoryGoal.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/ExecuteTrajectoryResult.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/ExecuteTrajectoryFeedback.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_msgs/msg" TYPE FILE FILES
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupAction.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupActionGoal.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupActionResult.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupActionFeedback.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupGoal.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupResult.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupFeedback.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_msgs/msg" TYPE FILE FILES
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupSequenceAction.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupSequenceActionGoal.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupSequenceActionResult.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupSequenceActionFeedback.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupSequenceGoal.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupSequenceResult.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/MoveGroupSequenceFeedback.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_msgs/msg" TYPE FILE FILES
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PickupAction.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PickupActionGoal.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PickupActionResult.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PickupActionFeedback.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PickupGoal.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PickupResult.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PickupFeedback.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_msgs/msg" TYPE FILE FILES
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PlaceAction.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PlaceActionGoal.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PlaceActionResult.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PlaceActionFeedback.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PlaceGoal.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PlaceResult.msg"
    "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/moveit_msgs/msg/PlaceFeedback.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_msgs/msg" TYPE FILE FILES
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/AllowedCollisionEntry.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/AllowedCollisionMatrix.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/AttachedCollisionObject.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/BoundingVolume.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/CartesianPoint.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/CartesianTrajectory.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/CartesianTrajectoryPoint.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/CollisionObject.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/ConstraintEvalResult.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/Constraints.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/CostSource.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/ContactInformation.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/DisplayTrajectory.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/DisplayRobotState.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/GenericTrajectory.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/Grasp.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/GripperTranslation.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/JointConstraint.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/JointLimits.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/LinkPadding.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/LinkScale.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/MotionPlanRequest.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/MotionPlanResponse.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/MotionPlanDetailedResponse.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/MotionSequenceItem.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/MotionSequenceRequest.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/MotionSequenceResponse.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/MoveItErrorCodes.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/TrajectoryConstraints.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/ObjectColor.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/OrientationConstraint.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/OrientedBoundingBox.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/PlaceLocation.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/PlannerInterfaceDescription.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/PlannerParams.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/PlanningScene.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/PlanningSceneComponents.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/PlanningSceneWorld.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/PlanningOptions.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/PositionConstraint.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/RobotState.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/RobotTrajectory.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/VisibilityConstraint.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/WorkspaceParameters.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/KinematicSolverInfo.msg"
    "/home/orangepi/catkin_ws/src/moveit_msgs/msg/PositionIKRequest.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_msgs/srv" TYPE FILE FILES
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/GetMotionPlan.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/ExecuteKnownTrajectory.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/GetStateValidity.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/GetCartesianPath.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/GetPlanningScene.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/GraspPlanning.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/ApplyPlanningScene.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/QueryPlannerInterfaces.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/GetMotionSequence.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/GetPositionFK.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/GetPositionIK.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/GetPlannerParams.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/SetPlannerParams.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/UpdatePointcloudOctomap.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/SaveMap.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/LoadMap.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/SaveRobotStateToWarehouse.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/ListRobotStatesInWarehouse.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/GetRobotStateFromWarehouse.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/CheckIfRobotStateExistsInWarehouse.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/RenameRobotStateInWarehouse.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/DeleteRobotStateFromWarehouse.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/ChangeControlDimensions.srv"
    "/home/orangepi/catkin_ws/src/moveit_msgs/srv/ChangeDriftDimensions.srv"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_msgs/cmake" TYPE FILE FILES "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/moveit_msgs-msg-paths.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/include/moveit_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/roseus/ros/moveit_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/common-lisp/ros/moveit_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/share/gennodejs/ros/moveit_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/lib/python3/dist-packages/moveit_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/orangepi/catkin_ws/devel/.private/moveit_msgs/lib/python3/dist-packages/moveit_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/moveit_msgs.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_msgs/cmake" TYPE FILE FILES "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/moveit_msgs-msg-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_msgs/cmake" TYPE FILE FILES
    "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/moveit_msgsConfig.cmake"
    "/home/orangepi/catkin_ws/build/moveit_msgs/catkin_generated/installspace/moveit_msgsConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_msgs" TYPE FILE FILES "/home/orangepi/catkin_ws/src/moveit_msgs/package.xml")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/orangepi/catkin_ws/build/moveit_msgs/gtest/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/orangepi/catkin_ws/build/moveit_msgs/install_local_manifest.txt"
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
  file(WRITE "/home/orangepi/catkin_ws/build/moveit_msgs/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
