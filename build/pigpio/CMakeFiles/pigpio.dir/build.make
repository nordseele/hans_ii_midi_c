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
include pigpio/CMakeFiles/pigpio.dir/depend.make

# Include the progress variables for this target.
include pigpio/CMakeFiles/pigpio.dir/progress.make

# Include the compile flags for this target's objects.
include pigpio/CMakeFiles/pigpio.dir/flags.make

pigpio/CMakeFiles/pigpio.dir/pigpio.c.o: pigpio/CMakeFiles/pigpio.dir/flags.make
pigpio/CMakeFiles/pigpio.dir/pigpio.c.o: ../pigpio/pigpio.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/hans_ii_midi_c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object pigpio/CMakeFiles/pigpio.dir/pigpio.c.o"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/pigpio.dir/pigpio.c.o   -c /home/pi/hans_ii_midi_c/pigpio/pigpio.c

pigpio/CMakeFiles/pigpio.dir/pigpio.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/pigpio.dir/pigpio.c.i"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/hans_ii_midi_c/pigpio/pigpio.c > CMakeFiles/pigpio.dir/pigpio.c.i

pigpio/CMakeFiles/pigpio.dir/pigpio.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/pigpio.dir/pigpio.c.s"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/hans_ii_midi_c/pigpio/pigpio.c -o CMakeFiles/pigpio.dir/pigpio.c.s

pigpio/CMakeFiles/pigpio.dir/command.c.o: pigpio/CMakeFiles/pigpio.dir/flags.make
pigpio/CMakeFiles/pigpio.dir/command.c.o: ../pigpio/command.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/hans_ii_midi_c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object pigpio/CMakeFiles/pigpio.dir/command.c.o"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/pigpio.dir/command.c.o   -c /home/pi/hans_ii_midi_c/pigpio/command.c

pigpio/CMakeFiles/pigpio.dir/command.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/pigpio.dir/command.c.i"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/hans_ii_midi_c/pigpio/command.c > CMakeFiles/pigpio.dir/command.c.i

pigpio/CMakeFiles/pigpio.dir/command.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/pigpio.dir/command.c.s"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/hans_ii_midi_c/pigpio/command.c -o CMakeFiles/pigpio.dir/command.c.s

# Object files for target pigpio
pigpio_OBJECTS = \
"CMakeFiles/pigpio.dir/pigpio.c.o" \
"CMakeFiles/pigpio.dir/command.c.o"

# External object files for target pigpio
pigpio_EXTERNAL_OBJECTS =

pigpio/libpigpio.so: pigpio/CMakeFiles/pigpio.dir/pigpio.c.o
pigpio/libpigpio.so: pigpio/CMakeFiles/pigpio.dir/command.c.o
pigpio/libpigpio.so: pigpio/CMakeFiles/pigpio.dir/build.make
pigpio/libpigpio.so: pigpio/CMakeFiles/pigpio.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/hans_ii_midi_c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared library libpigpio.so"
	cd /home/pi/hans_ii_midi_c/build/pigpio && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pigpio.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
pigpio/CMakeFiles/pigpio.dir/build: pigpio/libpigpio.so

.PHONY : pigpio/CMakeFiles/pigpio.dir/build

pigpio/CMakeFiles/pigpio.dir/clean:
	cd /home/pi/hans_ii_midi_c/build/pigpio && $(CMAKE_COMMAND) -P CMakeFiles/pigpio.dir/cmake_clean.cmake
.PHONY : pigpio/CMakeFiles/pigpio.dir/clean

pigpio/CMakeFiles/pigpio.dir/depend:
	cd /home/pi/hans_ii_midi_c/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/hans_ii_midi_c /home/pi/hans_ii_midi_c/pigpio /home/pi/hans_ii_midi_c/build /home/pi/hans_ii_midi_c/build/pigpio /home/pi/hans_ii_midi_c/build/pigpio/CMakeFiles/pigpio.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pigpio/CMakeFiles/pigpio.dir/depend

