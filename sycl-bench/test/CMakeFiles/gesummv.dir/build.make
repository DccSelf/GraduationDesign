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
include CMakeFiles/gesummv.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/gesummv.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gesummv.dir/flags.make

CMakeFiles/gesummv.dir/polybench/gesummv.cpp.o: CMakeFiles/gesummv.dir/flags.make
CMakeFiles/gesummv.dir/polybench/gesummv.cpp.o: ../polybench/gesummv.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/thfs1/home/penglin/dcc/sycl-bench/test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/gesummv.dir/polybench/gesummv.cpp.o"
	/thfs1/home/penglin/dcc/sycl_workspace/llvm-2022-06/build/install/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gesummv.dir/polybench/gesummv.cpp.o -c /thfs1/home/penglin/dcc/sycl-bench/polybench/gesummv.cpp

CMakeFiles/gesummv.dir/polybench/gesummv.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gesummv.dir/polybench/gesummv.cpp.i"
	/thfs1/home/penglin/dcc/sycl_workspace/llvm-2022-06/build/install/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /thfs1/home/penglin/dcc/sycl-bench/polybench/gesummv.cpp > CMakeFiles/gesummv.dir/polybench/gesummv.cpp.i

CMakeFiles/gesummv.dir/polybench/gesummv.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gesummv.dir/polybench/gesummv.cpp.s"
	/thfs1/home/penglin/dcc/sycl_workspace/llvm-2022-06/build/install/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /thfs1/home/penglin/dcc/sycl-bench/polybench/gesummv.cpp -o CMakeFiles/gesummv.dir/polybench/gesummv.cpp.s

# Object files for target gesummv
gesummv_OBJECTS = \
"CMakeFiles/gesummv.dir/polybench/gesummv.cpp.o"

# External object files for target gesummv
gesummv_EXTERNAL_OBJECTS =

gesummv: CMakeFiles/gesummv.dir/polybench/gesummv.cpp.o
gesummv: CMakeFiles/gesummv.dir/build.make
gesummv: CMakeFiles/gesummv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/thfs1/home/penglin/dcc/sycl-bench/test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable gesummv"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gesummv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gesummv.dir/build: gesummv

.PHONY : CMakeFiles/gesummv.dir/build

CMakeFiles/gesummv.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gesummv.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gesummv.dir/clean

CMakeFiles/gesummv.dir/depend:
	cd /thfs1/home/penglin/dcc/sycl-bench/test && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /thfs1/home/penglin/dcc/sycl-bench /thfs1/home/penglin/dcc/sycl-bench /thfs1/home/penglin/dcc/sycl-bench/test /thfs1/home/penglin/dcc/sycl-bench/test /thfs1/home/penglin/dcc/sycl-bench/test/CMakeFiles/gesummv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gesummv.dir/depend

