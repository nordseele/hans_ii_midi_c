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

# Include any dependencies generated for this target.
include rtmidi/CMakeFiles/cmidiin.dir/depend.make

# Include the progress variables for this target.
include rtmidi/CMakeFiles/cmidiin.dir/progress.make

# Include the compile flags for this target's objects.
include rtmidi/CMakeFiles/cmidiin.dir/flags.make

rtmidi/CMakeFiles/cmidiin.dir/tests/cmidiin.cpp.o: rtmidi/CMakeFiles/cmidiin.dir/flags.make
rtmidi/CMakeFiles/cmidiin.dir/tests/cmidiin.cpp.o: ../rtmidi/tests/cmidiin.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/hans_ii_midi_c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object rtmidi/CMakeFiles/cmidiin.dir/tests/cmidiin.cpp.o"
	cd /home/pi/hans_ii_midi_c/build/rtmidi && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cmidiin.dir/tests/cmidiin.cpp.o -c /home/pi/hans_ii_midi_c/rtmidi/tests/cmidiin.cpp

rtmidi/CMakeFiles/cmidiin.dir/tests/cmidiin.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cmidiin.dir/tests/cmidiin.cpp.i"
	cd /home/pi/hans_ii_midi_c/build/rtmidi && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/hans_ii_midi_c/rtmidi/tests/cmidiin.cpp > CMakeFiles/cmidiin.dir/tests/cmidiin.cpp.i

rtmidi/CMakeFiles/cmidiin.dir/tests/cmidiin.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cmidiin.dir/tests/cmidiin.cpp.s"
	cd /home/pi/hans_ii_midi_c/build/rtmidi && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/hans_ii_midi_c/rtmidi/tests/cmidiin.cpp -o CMakeFiles/cmidiin.dir/tests/cmidiin.cpp.s

# Object files for target cmidiin
cmidiin_OBJECTS = \
"CMakeFiles/cmidiin.dir/tests/cmidiin.cpp.o"

# External object files for target cmidiin
cmidiin_EXTERNAL_OBJECTS =

rtmidi/tests/cmidiin: rtmidi/CMakeFiles/cmidiin.dir/tests/cmidiin.cpp.o
rtmidi/tests/cmidiin: rtmidi/CMakeFiles/cmidiin.dir/build.make
rtmidi/tests/cmidiin: rtmidi/librtmidi.so.5.0.0
rtmidi/tests/cmidiin: /usr/lib/arm-linux-gnueabihf/libasound.so
rtmidi/tests/cmidiin: rtmidi/CMakeFiles/cmidiin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/hans_ii_midi_c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable tests/cmidiin"
	cd /home/pi/hans_ii_midi_c/build/rtmidi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cmidiin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
rtmidi/CMakeFiles/cmidiin.dir/build: rtmidi/tests/cmidiin

.PHONY : rtmidi/CMakeFiles/cmidiin.dir/build

rtmidi/CMakeFiles/cmidiin.dir/clean:
	cd /home/pi/hans_ii_midi_c/build/rtmidi && $(CMAKE_COMMAND) -P CMakeFiles/cmidiin.dir/cmake_clean.cmake
.PHONY : rtmidi/CMakeFiles/cmidiin.dir/clean

rtmidi/CMakeFiles/cmidiin.dir/depend:
	cd /home/pi/hans_ii_midi_c/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/hans_ii_midi_c /home/pi/hans_ii_midi_c/rtmidi /home/pi/hans_ii_midi_c/build /home/pi/hans_ii_midi_c/build/rtmidi /home/pi/hans_ii_midi_c/build/rtmidi/CMakeFiles/cmidiin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : rtmidi/CMakeFiles/cmidiin.dir/depend

