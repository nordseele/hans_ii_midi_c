# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

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
CMAKE_SOURCE_DIR = /home/pi/hans_ii_midi_c

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/hans_ii_midi_c/build

# Utility rule file for ExperimentalStart.

# Include the progress variables for this target.
include pigpio/CMakeFiles/ExperimentalStart.dir/progress.make

pigpio/CMakeFiles/ExperimentalStart:
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/ctest -D ExperimentalStart

ExperimentalStart: pigpio/CMakeFiles/ExperimentalStart
ExperimentalStart: pigpio/CMakeFiles/ExperimentalStart.dir/build.make

.PHONY : ExperimentalStart

# Rule to build all files generated by this target.
pigpio/CMakeFiles/ExperimentalStart.dir/build: ExperimentalStart

.PHONY : pigpio/CMakeFiles/ExperimentalStart.dir/build

pigpio/CMakeFiles/ExperimentalStart.dir/clean:
	cd /home/pi/hans_ii_midi_c/build/pigpio && $(CMAKE_COMMAND) -P CMakeFiles/ExperimentalStart.dir/cmake_clean.cmake
.PHONY : pigpio/CMakeFiles/ExperimentalStart.dir/clean

pigpio/CMakeFiles/ExperimentalStart.dir/depend:
	cd /home/pi/hans_ii_midi_c/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/hans_ii_midi_c /home/pi/hans_ii_midi_c/rtmidi /home/pi/hans_ii_midi_c/build /home/pi/hans_ii_midi_c/build/pigpio /home/pi/hans_ii_midi_c/build/pigpio/CMakeFiles/ExperimentalStart.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pigpio/CMakeFiles/ExperimentalStart.dir/depend

