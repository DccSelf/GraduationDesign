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
include CMakeFiles/mol_dyn.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/mol_dyn.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mol_dyn.dir/flags.make

CMakeFiles/mol_dyn.dir/single-kernel/mol_dyn.cpp.o: CMakeFiles/mol_dyn.dir/flags.make
CMakeFiles/mol_dyn.dir/single-kernel/mol_dyn.cpp.o: ../single-kernel/mol_dyn.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/thfs1/home/penglin/dcc/sycl-bench/test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/mol_dyn.dir/single-kernel/mol_dyn.cpp.o"
	/thfs1/home/penglin/dcc/sycl_workspace/llvm-2022-06/build/install/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mol_dyn.dir/single-kernel/mol_dyn.cpp.o -c /thfs1/home/penglin/dcc/sycl-bench/single-kernel/mol_dyn.cpp

CMakeFiles/mol_dyn.dir/single-kernel/mol_dyn.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mol_dyn.dir/single-kernel/mol_dyn.cpp.i"
	/thfs1/home/penglin/dcc/sycl_workspace/llvm-2022-06/build/install/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /thfs1/home/penglin/dcc/sycl-bench/single-kernel/mol_dyn.cpp > CMakeFiles/mol_dyn.dir/single-kernel/mol_dyn.cpp.i

CMakeFiles/mol_dyn.dir/single-kernel/mol_dyn.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mol_dyn.dir/single-kernel/mol_dyn.cpp.s"
	/thfs1/home/penglin/dcc/sycl_workspace/llvm-2022-06/build/install/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /thfs1/home/penglin/dcc/sycl-bench/single-kernel/mol_dyn.cpp -o CMakeFiles/mol_dyn.dir/single-kernel/mol_dyn.cpp.s

# Object files for target mol_dyn
mol_dyn_OBJECTS = \
"CMakeFiles/mol_dyn.dir/single-kernel/mol_dyn.cpp.o"

# External object files for target mol_dyn
mol_dyn_EXTERNAL_OBJECTS =

mol_dyn: CMakeFiles/mol_dyn.dir/single-kernel/mol_dyn.cpp.o
mol_dyn: CMakeFiles/mol_dyn.dir/build.make
mol_dyn: CMakeFiles/mol_dyn.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/thfs1/home/penglin/dcc/sycl-bench/test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable mol_dyn"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mol_dyn.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mol_dyn.dir/build: mol_dyn

.PHONY : CMakeFiles/mol_dyn.dir/build

CMakeFiles/mol_dyn.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mol_dyn.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mol_dyn.dir/clean

CMakeFiles/mol_dyn.dir/depend:
	cd /thfs1/home/penglin/dcc/sycl-bench/test && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /thfs1/home/penglin/dcc/sycl-bench /thfs1/home/penglin/dcc/sycl-bench /thfs1/home/penglin/dcc/sycl-bench/test /thfs1/home/penglin/dcc/sycl-bench/test /thfs1/home/penglin/dcc/sycl-bench/test/CMakeFiles/mol_dyn.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mol_dyn.dir/depend
