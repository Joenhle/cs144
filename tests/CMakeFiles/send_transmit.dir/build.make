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

# Include any dependencies generated for this target.
include tests/CMakeFiles/send_transmit.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/send_transmit.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/send_transmit.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/send_transmit.dir/flags.make

tests/CMakeFiles/send_transmit.dir/send_transmit.cc.o: tests/CMakeFiles/send_transmit.dir/flags.make
tests/CMakeFiles/send_transmit.dir/send_transmit.cc.o: tests/send_transmit.cc
tests/CMakeFiles/send_transmit.dir/send_transmit.cc.o: tests/CMakeFiles/send_transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/send_transmit.dir/send_transmit.cc.o"
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/send_transmit.dir/send_transmit.cc.o -MF CMakeFiles/send_transmit.dir/send_transmit.cc.o.d -o CMakeFiles/send_transmit.dir/send_transmit.cc.o -c /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests/send_transmit.cc

tests/CMakeFiles/send_transmit.dir/send_transmit.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/send_transmit.dir/send_transmit.cc.i"
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests/send_transmit.cc > CMakeFiles/send_transmit.dir/send_transmit.cc.i

tests/CMakeFiles/send_transmit.dir/send_transmit.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/send_transmit.dir/send_transmit.cc.s"
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests/send_transmit.cc -o CMakeFiles/send_transmit.dir/send_transmit.cc.s

# Object files for target send_transmit
send_transmit_OBJECTS = \
"CMakeFiles/send_transmit.dir/send_transmit.cc.o"

# External object files for target send_transmit
send_transmit_EXTERNAL_OBJECTS =

tests/send_transmit: tests/CMakeFiles/send_transmit.dir/send_transmit.cc.o
tests/send_transmit: tests/CMakeFiles/send_transmit.dir/build.make
tests/send_transmit: tests/libspongechecks.a
tests/send_transmit: libsponge/libsponge.a
tests/send_transmit: tests/CMakeFiles/send_transmit.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable send_transmit"
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/send_transmit.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/send_transmit.dir/build: tests/send_transmit
.PHONY : tests/CMakeFiles/send_transmit.dir/build

tests/CMakeFiles/send_transmit.dir/clean:
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests && $(CMAKE_COMMAND) -P CMakeFiles/send_transmit.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/send_transmit.dir/clean

tests/CMakeFiles/send_transmit.dir/depend:
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144 /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144 /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests/CMakeFiles/send_transmit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/send_transmit.dir/depend

