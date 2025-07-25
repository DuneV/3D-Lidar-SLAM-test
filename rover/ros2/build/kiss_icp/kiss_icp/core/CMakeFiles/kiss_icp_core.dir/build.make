# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workspace/rover/ros2/src/kiss-icp/ros

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspace/rover/ros2/build/kiss_icp

# Include any dependencies generated for this target.
include kiss_icp/core/CMakeFiles/kiss_icp_core.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include kiss_icp/core/CMakeFiles/kiss_icp_core.dir/compiler_depend.make

# Include the progress variables for this target.
include kiss_icp/core/CMakeFiles/kiss_icp_core.dir/progress.make

# Include the compile flags for this target's objects.
include kiss_icp/core/CMakeFiles/kiss_icp_core.dir/flags.make

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Registration.cpp.o: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/flags.make
kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Registration.cpp.o: /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/Registration.cpp
kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Registration.cpp.o: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/rover/ros2/build/kiss_icp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Registration.cpp.o"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Registration.cpp.o -MF CMakeFiles/kiss_icp_core.dir/Registration.cpp.o.d -o CMakeFiles/kiss_icp_core.dir/Registration.cpp.o -c /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/Registration.cpp

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Registration.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kiss_icp_core.dir/Registration.cpp.i"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/Registration.cpp > CMakeFiles/kiss_icp_core.dir/Registration.cpp.i

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Registration.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kiss_icp_core.dir/Registration.cpp.s"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/Registration.cpp -o CMakeFiles/kiss_icp_core.dir/Registration.cpp.s

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.o: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/flags.make
kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.o: /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/VoxelHashMap.cpp
kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.o: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/rover/ros2/build/kiss_icp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.o"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.o -MF CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.o.d -o CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.o -c /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/VoxelHashMap.cpp

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.i"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/VoxelHashMap.cpp > CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.i

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.s"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/VoxelHashMap.cpp -o CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.s

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.o: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/flags.make
kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.o: /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/VoxelUtils.cpp
kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.o: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/rover/ros2/build/kiss_icp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.o"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.o -MF CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.o.d -o CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.o -c /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/VoxelUtils.cpp

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.i"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/VoxelUtils.cpp > CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.i

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.s"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/VoxelUtils.cpp -o CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.s

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.o: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/flags.make
kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.o: /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/Preprocessing.cpp
kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.o: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/rover/ros2/build/kiss_icp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.o"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.o -MF CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.o.d -o CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.o -c /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/Preprocessing.cpp

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.i"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/Preprocessing.cpp > CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.i

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.s"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/Preprocessing.cpp -o CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.s

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Threshold.cpp.o: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/flags.make
kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Threshold.cpp.o: /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/Threshold.cpp
kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Threshold.cpp.o: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/rover/ros2/build/kiss_icp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Threshold.cpp.o"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Threshold.cpp.o -MF CMakeFiles/kiss_icp_core.dir/Threshold.cpp.o.d -o CMakeFiles/kiss_icp_core.dir/Threshold.cpp.o -c /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/Threshold.cpp

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Threshold.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kiss_icp_core.dir/Threshold.cpp.i"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/Threshold.cpp > CMakeFiles/kiss_icp_core.dir/Threshold.cpp.i

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Threshold.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kiss_icp_core.dir/Threshold.cpp.s"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core/Threshold.cpp -o CMakeFiles/kiss_icp_core.dir/Threshold.cpp.s

# Object files for target kiss_icp_core
kiss_icp_core_OBJECTS = \
"CMakeFiles/kiss_icp_core.dir/Registration.cpp.o" \
"CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.o" \
"CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.o" \
"CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.o" \
"CMakeFiles/kiss_icp_core.dir/Threshold.cpp.o"

# External object files for target kiss_icp_core
kiss_icp_core_EXTERNAL_OBJECTS =

kiss_icp/core/libkiss_icp_core.a: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Registration.cpp.o
kiss_icp/core/libkiss_icp_core.a: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelHashMap.cpp.o
kiss_icp/core/libkiss_icp_core.a: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/VoxelUtils.cpp.o
kiss_icp/core/libkiss_icp_core.a: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Preprocessing.cpp.o
kiss_icp/core/libkiss_icp_core.a: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/Threshold.cpp.o
kiss_icp/core/libkiss_icp_core.a: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/build.make
kiss_icp/core/libkiss_icp_core.a: kiss_icp/core/CMakeFiles/kiss_icp_core.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspace/rover/ros2/build/kiss_icp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX static library libkiss_icp_core.a"
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && $(CMAKE_COMMAND) -P CMakeFiles/kiss_icp_core.dir/cmake_clean_target.cmake
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kiss_icp_core.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
kiss_icp/core/CMakeFiles/kiss_icp_core.dir/build: kiss_icp/core/libkiss_icp_core.a
.PHONY : kiss_icp/core/CMakeFiles/kiss_icp_core.dir/build

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/clean:
	cd /workspace/rover/ros2/build/kiss_icp/kiss_icp/core && $(CMAKE_COMMAND) -P CMakeFiles/kiss_icp_core.dir/cmake_clean.cmake
.PHONY : kiss_icp/core/CMakeFiles/kiss_icp_core.dir/clean

kiss_icp/core/CMakeFiles/kiss_icp_core.dir/depend:
	cd /workspace/rover/ros2/build/kiss_icp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspace/rover/ros2/src/kiss-icp/ros /workspace/rover/ros2/src/kiss-icp/cpp/kiss_icp/core /workspace/rover/ros2/build/kiss_icp /workspace/rover/ros2/build/kiss_icp/kiss_icp/core /workspace/rover/ros2/build/kiss_icp/kiss_icp/core/CMakeFiles/kiss_icp_core.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : kiss_icp/core/CMakeFiles/kiss_icp_core.dir/depend

