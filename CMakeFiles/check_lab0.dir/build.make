# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.22.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.22.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144

# Utility rule file for check_lab0.

# Include any custom commands dependencies for this target.
include CMakeFiles/check_lab0.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/check_lab0.dir/progress.make

CMakeFiles/check_lab0:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Testing Lab 0..."
	/usr/local/Cellar/cmake/3.22.1/bin/ctest --output-on-failure --timeout 10 -R 't_webget|t_byte_stream|_dt'

check_lab0: CMakeFiles/check_lab0
check_lab0: CMakeFiles/check_lab0.dir/build.make
.PHONY : check_lab0

# Rule to build all files generated by this target.
CMakeFiles/check_lab0.dir/build: check_lab0
.PHONY : CMakeFiles/check_lab0.dir/build

CMakeFiles/check_lab0.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/check_lab0.dir/cmake_clean.cmake
.PHONY : CMakeFiles/check_lab0.dir/clean

CMakeFiles/check_lab0.dir/depend:
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144 /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144 /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144 /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144 /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/CMakeFiles/check_lab0.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/check_lab0.dir/depend

