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
CMAKE_SOURCE_DIR = /thfs1/home/penglin/dcc/sycl-bench

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /thfs1/home/penglin/dcc/sycl-bench/test

# Include any dependencies generated for this target.
include CMakeFiles/syr2k.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/syr2k.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/syr2k.dir/flags.make

CMakeFiles/syr2k.dir/polybench/syr2k.cpp.o: CMakeFiles/syr2k.dir/flags.make
CMakeFiles/syr2k.dir/polybench/syr2k.cpp.o: ../polybench/syr2k.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/thfs1/home/penglin/dcc/sycl-bench/test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/syr2k.dir/polybench/syr2k.cpp.o"
	/thfs1/home/penglin/dcc/sycl_workspace/llvm-2022-06/build/install/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/syr2k.dir/polybench/syr2k.cpp.o -c /thfs1/home/penglin/dcc/sycl-bench/polybench/syr2k.cpp

CMakeFiles/syr2k.dir/polybench/syr2k.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/syr2k.dir/polybench/syr2k.cpp.i"
	/thfs1/home/penglin/dcc/sycl_workspace/llvm-2022-06/build/install/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /thfs1/home/penglin/dcc/sycl-bench/polybench/syr2k.cpp > CMakeFiles/syr2k.dir/polybench/syr2k.cpp.i

CMakeFiles/syr2k.dir/polybench/syr2k.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/syr2k.dir/polybench/syr2k.cpp.s"
	/thfs1/home/penglin/dcc/sycl_workspace/llvm-2022-06/build/install/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /thfs1/home/penglin/dcc/sycl-bench/polybench/syr2k.cpp -o CMakeFiles/syr2k.dir/polybench/syr2k.cpp.s

# Object files for target syr2k
syr2k_OBJECTS = \
"CMakeFiles/syr2k.dir/polybench/syr2k.cpp.o"

# External object files for target syr2k
syr2k_EXTERNAL_OBJECTS =

syr2k: CMakeFiles/syr2k.dir/polybench/syr2k.cpp.o
syr2k: CMakeFiles/syr2k.dir/build.make
syr2k: CMakeFiles/syr2k.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/thfs1/home/penglin/dcc/sycl-bench/test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable syr2k"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/syr2k.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/syr2k.dir/build: syr2k

.PHONY : CMakeFiles/syr2k.dir/build

CMakeFiles/syr2k.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/syr2k.dir/cmake_clean.cmake
.PHONY : CMakeFiles/syr2k.dir/clean

CMakeFiles/syr2k.dir/depend:
	cd /thfs1/home/penglin/dcc/sycl-bench/test && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /thfs1/home/penglin/dcc/sycl-bench /thfs1/home/penglin/dcc/sycl-bench /thfs1/home/penglin/dcc/sycl-bench/test /thfs1/home/penglin/dcc/sycl-bench/test /thfs1/home/penglin/dcc/sycl-bench/test/CMakeFiles/syr2k.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/syr2k.dir/depend

