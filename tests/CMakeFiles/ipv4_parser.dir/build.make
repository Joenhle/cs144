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
include tests/CMakeFiles/ipv4_parser.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/ipv4_parser.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/ipv4_parser.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/ipv4_parser.dir/flags.make

tests/CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.o: tests/CMakeFiles/ipv4_parser.dir/flags.make
tests/CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.o: tests/ipv4_parser.cc
tests/CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.o: tests/CMakeFiles/ipv4_parser.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.o"
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.o -MF CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.o.d -o CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.o -c /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests/ipv4_parser.cc

tests/CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.i"
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests/ipv4_parser.cc > CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.i

tests/CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.s"
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests/ipv4_parser.cc -o CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.s

# Object files for target ipv4_parser
ipv4_parser_OBJECTS = \
"CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.o"

# External object files for target ipv4_parser
ipv4_parser_EXTERNAL_OBJECTS =

tests/ipv4_parser: tests/CMakeFiles/ipv4_parser.dir/ipv4_parser.cc.o
tests/ipv4_parser: tests/CMakeFiles/ipv4_parser.dir/build.make
tests/ipv4_parser: tests/libspongechecks.a
tests/ipv4_parser: /Library/Developer/CommandLineTools/SDKs/MacOSX12.1.sdk/usr/lib/libpcap.tbd
tests/ipv4_parser: libsponge/libsponge.a
tests/ipv4_parser: /Library/Developer/CommandLineTools/SDKs/MacOSX12.1.sdk/usr/lib/libpcap.tbd
tests/ipv4_parser: tests/CMakeFiles/ipv4_parser.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ipv4_parser"
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ipv4_parser.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/ipv4_parser.dir/build: tests/ipv4_parser
.PHONY : tests/CMakeFiles/ipv4_parser.dir/build

tests/CMakeFiles/ipv4_parser.dir/clean:
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests && $(CMAKE_COMMAND) -P CMakeFiles/ipv4_parser.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/ipv4_parser.dir/clean

tests/CMakeFiles/ipv4_parser.dir/depend:
	cd /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144 /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144 /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests /Users/huangjunhao/go/src/code.onlearn.org/network/vsf/cs144/tests/CMakeFiles/ipv4_parser.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/ipv4_parser.dir/depend

