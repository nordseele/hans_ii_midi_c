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
include pigpio/CMakeFiles/pigs.dir/depend.make

# Include the progress variables for this target.
include pigpio/CMakeFiles/pigs.dir/progress.make

# Include the compile flags for this target's objects.
include pigpio/CMakeFiles/pigs.dir/flags.make

pigpio/CMakeFiles/pigs.dir/pigs.c.o: pigpio/CMakeFiles/pigs.dir/flags.make
pigpio/CMakeFiles/pigs.dir/pigs.c.o: ../pigpio/pigs.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/hans_ii_midi_c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object pigpio/CMakeFiles/pigs.dir/pigs.c.o"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/pigs.dir/pigs.c.o   -c /home/pi/hans_ii_midi_c/pigpio/pigs.c

pigpio/CMakeFiles/pigs.dir/pigs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/pigs.dir/pigs.c.i"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/hans_ii_midi_c/pigpio/pigs.c > CMakeFiles/pigs.dir/pigs.c.i

pigpio/CMakeFiles/pigs.dir/pigs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/pigs.dir/pigs.c.s"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/hans_ii_midi_c/pigpio/pigs.c -o CMakeFiles/pigs.dir/pigs.c.s

pigpio/CMakeFiles/pigs.dir/command.c.o: pigpio/CMakeFiles/pigs.dir/flags.make
pigpio/CMakeFiles/pigs.dir/command.c.o: ../pigpio/command.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/hans_ii_midi_c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object pigpio/CMakeFiles/pigs.dir/command.c.o"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/pigs.dir/command.c.o   -c /home/pi/hans_ii_midi_c/pigpio/command.c

pigpio/CMakeFiles/pigs.dir/command.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/pigs.dir/command.c.i"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/hans_ii_midi_c/pigpio/command.c > CMakeFiles/pigs.dir/command.c.i

pigpio/CMakeFiles/pigs.dir/command.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/pigs.dir/command.c.s"
	cd /home/pi/hans_ii_midi_c/build/pigpio && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/hans_ii_midi_c/pigpio/command.c -o CMakeFiles/pigs.dir/command.c.s

# Object files for target pigs
pigs_OBJECTS = \
"CMakeFiles/pigs.dir/pigs.c.o" \
"CMakeFiles/pigs.dir/command.c.o"

# External object files for target pigs
pigs_EXTERNAL_OBJECTS =

pigpio/pigs: pigpio/CMakeFiles/pigs.dir/pigs.c.o
pigpio/pigs: pigpio/CMakeFiles/pigs.dir/command.c.o
pigpio/pigs: pigpio/CMakeFiles/pigs.dir/build.make
pigpio/pigs: pigpio/CMakeFiles/pigs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/hans_ii_midi_c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable pigs"
	cd /home/pi/hans_ii_midi_c/build/pigpio && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pigs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
pigpio/CMakeFiles/pigs.dir/build: pigpio/pigs

.PHONY : pigpio/CMakeFiles/pigs.dir/build

pigpio/CMakeFiles/pigs.dir/clean:
	cd /home/pi/hans_ii_midi_c/build/pigpio && $(CMAKE_COMMAND) -P CMakeFiles/pigs.dir/cmake_clean.cmake
.PHONY : pigpio/CMakeFiles/pigs.dir/clean

pigpio/CMakeFiles/pigs.dir/depend:
	cd /home/pi/hans_ii_midi_c/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/hans_ii_midi_c /home/pi/hans_ii_midi_c/pigpio /home/pi/hans_ii_midi_c/build /home/pi/hans_ii_midi_c/build/pigpio /home/pi/hans_ii_midi_c/build/pigpio/CMakeFiles/pigs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pigpio/CMakeFiles/pigs.dir/depend
