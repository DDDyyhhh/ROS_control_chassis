# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/orangepi/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/orangepi/catkin_ws/build

# Utility rule file for _run_tests_cv_bridge_nosetests.

# Include the progress variables for this target.
include vision_opencv-noetic/cv_bridge/test/CMakeFiles/_run_tests_cv_bridge_nosetests.dir/progress.make

_run_tests_cv_bridge_nosetests: vision_opencv-noetic/cv_bridge/test/CMakeFiles/_run_tests_cv_bridge_nosetests.dir/build.make

.PHONY : _run_tests_cv_bridge_nosetests

# Rule to build all files generated by this target.
vision_opencv-noetic/cv_bridge/test/CMakeFiles/_run_tests_cv_bridge_nosetests.dir/build: _run_tests_cv_bridge_nosetests

.PHONY : vision_opencv-noetic/cv_bridge/test/CMakeFiles/_run_tests_cv_bridge_nosetests.dir/build

vision_opencv-noetic/cv_bridge/test/CMakeFiles/_run_tests_cv_bridge_nosetests.dir/clean:
	cd /home/orangepi/catkin_ws/build/vision_opencv-noetic/cv_bridge/test && $(CMAKE_COMMAND) -P CMakeFiles/_run_tests_cv_bridge_nosetests.dir/cmake_clean.cmake
.PHONY : vision_opencv-noetic/cv_bridge/test/CMakeFiles/_run_tests_cv_bridge_nosetests.dir/clean

vision_opencv-noetic/cv_bridge/test/CMakeFiles/_run_tests_cv_bridge_nosetests.dir/depend:
	cd /home/orangepi/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/orangepi/catkin_ws/src /home/orangepi/catkin_ws/src/vision_opencv-noetic/cv_bridge/test /home/orangepi/catkin_ws/build /home/orangepi/catkin_ws/build/vision_opencv-noetic/cv_bridge/test /home/orangepi/catkin_ws/build/vision_opencv-noetic/cv_bridge/test/CMakeFiles/_run_tests_cv_bridge_nosetests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vision_opencv-noetic/cv_bridge/test/CMakeFiles/_run_tests_cv_bridge_nosetests.dir/depend

