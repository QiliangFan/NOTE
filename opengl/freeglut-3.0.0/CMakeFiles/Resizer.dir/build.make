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
CMAKE_SOURCE_DIR = /home/liangliang/doc/note/opengl/freeglut-3.0.0

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/liangliang/doc/note/opengl/freeglut-3.0.0

# Include any dependencies generated for this target.
include CMakeFiles/Resizer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Resizer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Resizer.dir/flags.make

CMakeFiles/Resizer.dir/progs/demos/Resizer/Resizer.cpp.o: CMakeFiles/Resizer.dir/flags.make
CMakeFiles/Resizer.dir/progs/demos/Resizer/Resizer.cpp.o: progs/demos/Resizer/Resizer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liangliang/doc/note/opengl/freeglut-3.0.0/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Resizer.dir/progs/demos/Resizer/Resizer.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Resizer.dir/progs/demos/Resizer/Resizer.cpp.o -c /home/liangliang/doc/note/opengl/freeglut-3.0.0/progs/demos/Resizer/Resizer.cpp

CMakeFiles/Resizer.dir/progs/demos/Resizer/Resizer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Resizer.dir/progs/demos/Resizer/Resizer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liangliang/doc/note/opengl/freeglut-3.0.0/progs/demos/Resizer/Resizer.cpp > CMakeFiles/Resizer.dir/progs/demos/Resizer/Resizer.cpp.i

CMakeFiles/Resizer.dir/progs/demos/Resizer/Resizer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Resizer.dir/progs/demos/Resizer/Resizer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liangliang/doc/note/opengl/freeglut-3.0.0/progs/demos/Resizer/Resizer.cpp -o CMakeFiles/Resizer.dir/progs/demos/Resizer/Resizer.cpp.s

# Object files for target Resizer
Resizer_OBJECTS = \
"CMakeFiles/Resizer.dir/progs/demos/Resizer/Resizer.cpp.o"

# External object files for target Resizer
Resizer_EXTERNAL_OBJECTS =

bin/Resizer: CMakeFiles/Resizer.dir/progs/demos/Resizer/Resizer.cpp.o
bin/Resizer: CMakeFiles/Resizer.dir/build.make
bin/Resizer: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libGL.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libSM.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libICE.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libX11.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libXext.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libXrandr.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libXi.so
bin/Resizer: lib/libglut.so.3.10.0
bin/Resizer: /usr/lib/x86_64-linux-gnu/libGL.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libSM.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libICE.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libX11.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libXext.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libXrandr.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
bin/Resizer: /usr/lib/x86_64-linux-gnu/libXi.so
bin/Resizer: CMakeFiles/Resizer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/liangliang/doc/note/opengl/freeglut-3.0.0/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/Resizer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Resizer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Resizer.dir/build: bin/Resizer

.PHONY : CMakeFiles/Resizer.dir/build

CMakeFiles/Resizer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Resizer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Resizer.dir/clean

CMakeFiles/Resizer.dir/depend:
	cd /home/liangliang/doc/note/opengl/freeglut-3.0.0 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liangliang/doc/note/opengl/freeglut-3.0.0 /home/liangliang/doc/note/opengl/freeglut-3.0.0 /home/liangliang/doc/note/opengl/freeglut-3.0.0 /home/liangliang/doc/note/opengl/freeglut-3.0.0 /home/liangliang/doc/note/opengl/freeglut-3.0.0/CMakeFiles/Resizer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Resizer.dir/depend

