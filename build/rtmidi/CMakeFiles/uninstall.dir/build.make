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

# Utility rule file for uninstall.

# Include the progress variables for this target.
include rtmidi/CMakeFiles/uninstall.dir/progress.make

rtmidi/CMakeFiles/uninstall:
	cd /home/pi/hans_ii_midi_c/build/rtmidi && /usr/bin/cmake -P /home/pi/hans_ii_midi_c/build/RtMidiConfigUninstall.cmake

uninstall: rtmidi/CMakeFiles/uninstall
uninstall: rtmidi/CMakeFiles/uninstall.dir/build.make

.PHONY : uninstall

# Rule to build all files generated by this target.
rtmidi/CMakeFiles/uninstall.dir/build: uninstall

.PHONY : rtmidi/CMakeFiles/uninstall.dir/build

rtmidi/CMakeFiles/uninstall.dir/clean:
	cd /home/pi/hans_ii_midi_c/build/rtmidi && $(CMAKE_COMMAND) -P CMakeFiles/uninstall.dir/cmake_clean.cmake
.PHONY : rtmidi/CMakeFiles/uninstall.dir/clean

rtmidi/CMakeFiles/uninstall.dir/depend:
	cd /home/pi/hans_ii_midi_c/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/hans_ii_midi_c /home/pi/hans_ii_midi_c/rtmidi /home/pi/hans_ii_midi_c/build /home/pi/hans_ii_midi_c/build/rtmidi /home/pi/hans_ii_midi_c/build/rtmidi/CMakeFiles/uninstall.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : rtmidi/CMakeFiles/uninstall.dir/depend

