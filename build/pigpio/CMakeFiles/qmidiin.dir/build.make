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
include pigpio/CMakeFiles/qmidiin.dir/depend.make

# Include the progress variables for this target.
include pigpio/CMakeFiles/qmidiin.dir/progress.make

# Include the compile flags for this target's objects.
include pigpio/CMakeFiles/qmidiin.dir/flags.make

pigpio/CMakeFiles/qmidiin.dir/tests/qmidiin.cpp.o: pigpio/CMakeFiles/qmidiin.dir/flags.make
pigpio/CMakeFiles/qmidiin.dir/tests/qmidiin.cpp.o: ../rtmidi/tests/qmidiin.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/hans_ii_midi_c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object pigpio/CMakeFiles/qmidiin.dir/tests/qmidiin.cpp.o"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/qmidiin.dir/tests/qmidiin.cpp.o -c /home/pi/hans_ii_midi_c/rtmidi/tests/qmidiin.cpp

pigpio/CMakeFiles/qmidiin.dir/tests/qmidiin.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/qmidiin.dir/tests/qmidiin.cpp.i"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/hans_ii_midi_c/rtmidi/tests/qmidiin.cpp > CMakeFiles/qmidiin.dir/tests/qmidiin.cpp.i

pigpio/CMakeFiles/qmidiin.dir/tests/qmidiin.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/qmidiin.dir/tests/qmidiin.cpp.s"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/hans_ii_midi_c/rtmidi/tests/qmidiin.cpp -o CMakeFiles/qmidiin.dir/tests/qmidiin.cpp.s

# Object files for target qmidiin
qmidiin_OBJECTS = \
"CMakeFiles/qmidiin.dir/tests/qmidiin.cpp.o"

# External object files for target qmidiin
qmidiin_EXTERNAL_OBJECTS =

pigpio/tests/qmidiin: pigpio/CMakeFiles/qmidiin.dir/tests/qmidiin.cpp.o
pigpio/tests/qmidiin: pigpio/CMakeFiles/qmidiin.dir/build.make
pigpio/tests/qmidiin: pigpio/librtmidi.so.5.0.0
pigpio/tests/qmidiin: /usr/lib/arm-linux-gnueabihf/libasound.so
pigpio/tests/qmidiin: pigpio/CMakeFiles/qmidiin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/hans_ii_midi_c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable tests/qmidiin"
	cd /home/pi/hans_ii_midi_c/build/pigpio && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/qmidiin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
pigpio/CMakeFiles/qmidiin.dir/build: pigpio/tests/qmidiin

.PHONY : pigpio/CMakeFiles/qmidiin.dir/build

pigpio/CMakeFiles/qmidiin.dir/clean:
	cd /home/pi/hans_ii_midi_c/build/pigpio && $(CMAKE_COMMAND) -P CMakeFiles/qmidiin.dir/cmake_clean.cmake
.PHONY : pigpio/CMakeFiles/qmidiin.dir/clean

pigpio/CMakeFiles/qmidiin.dir/depend:
	cd /home/pi/hans_ii_midi_c/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/hans_ii_midi_c /home/pi/hans_ii_midi_c/rtmidi /home/pi/hans_ii_midi_c/build /home/pi/hans_ii_midi_c/build/pigpio /home/pi/hans_ii_midi_c/build/pigpio/CMakeFiles/qmidiin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pigpio/CMakeFiles/qmidiin.dir/depend

