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
CMAKE_SOURCE_DIR = /home/otavio/scicobot_rasp/src/teste

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/otavio/scicobot_rasp/build/teste

# Include any dependencies generated for this target.
include CMakeFiles/teste.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/teste.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/teste.dir/flags.make

CMakeFiles/teste.dir/src/teste.cpp.o: CMakeFiles/teste.dir/flags.make
CMakeFiles/teste.dir/src/teste.cpp.o: /home/otavio/scicobot_rasp/src/teste/src/teste.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/otavio/scicobot_rasp/build/teste/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/teste.dir/src/teste.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/teste.dir/src/teste.cpp.o -c /home/otavio/scicobot_rasp/src/teste/src/teste.cpp

CMakeFiles/teste.dir/src/teste.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teste.dir/src/teste.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/otavio/scicobot_rasp/src/teste/src/teste.cpp > CMakeFiles/teste.dir/src/teste.cpp.i

CMakeFiles/teste.dir/src/teste.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teste.dir/src/teste.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/otavio/scicobot_rasp/src/teste/src/teste.cpp -o CMakeFiles/teste.dir/src/teste.cpp.s

# Object files for target teste
teste_OBJECTS = \
"CMakeFiles/teste.dir/src/teste.cpp.o"

# External object files for target teste
teste_EXTERNAL_OBJECTS =

teste: CMakeFiles/teste.dir/src/teste.cpp.o
teste: CMakeFiles/teste.dir/build.make
teste: /opt/ros/foxy/lib/librclcpp.so
teste: /opt/ros/foxy/lib/liblibstatistics_collector.so
teste: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_typesupport_introspection_c.so
teste: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_generator_c.so
teste: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_typesupport_c.so
teste: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_typesupport_introspection_cpp.so
teste: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_typesupport_cpp.so
teste: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_introspection_c.so
teste: /opt/ros/foxy/lib/libstd_msgs__rosidl_generator_c.so
teste: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_c.so
teste: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_introspection_cpp.so
teste: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_cpp.so
teste: /opt/ros/foxy/lib/librcl.so
teste: /opt/ros/foxy/lib/librcl_interfaces__rosidl_typesupport_introspection_c.so
teste: /opt/ros/foxy/lib/librcl_interfaces__rosidl_generator_c.so
teste: /opt/ros/foxy/lib/librcl_interfaces__rosidl_typesupport_c.so
teste: /opt/ros/foxy/lib/librcl_interfaces__rosidl_typesupport_introspection_cpp.so
teste: /opt/ros/foxy/lib/librcl_interfaces__rosidl_typesupport_cpp.so
teste: /opt/ros/foxy/lib/librmw_implementation.so
teste: /opt/ros/foxy/lib/librmw.so
teste: /opt/ros/foxy/lib/librcl_logging_spdlog.so
teste: /usr/lib/x86_64-linux-gnu/libspdlog.so.1.5.0
teste: /opt/ros/foxy/lib/librcl_yaml_param_parser.so
teste: /opt/ros/foxy/lib/libyaml.so
teste: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_typesupport_introspection_c.so
teste: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_generator_c.so
teste: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_typesupport_c.so
teste: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_typesupport_introspection_cpp.so
teste: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_typesupport_cpp.so
teste: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_typesupport_introspection_c.so
teste: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_generator_c.so
teste: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_typesupport_c.so
teste: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_typesupport_introspection_cpp.so
teste: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_typesupport_cpp.so
teste: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_introspection_c.so
teste: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_generator_c.so
teste: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_c.so
teste: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_introspection_cpp.so
teste: /opt/ros/foxy/lib/librosidl_typesupport_introspection_cpp.so
teste: /opt/ros/foxy/lib/librosidl_typesupport_introspection_c.so
teste: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_cpp.so
teste: /opt/ros/foxy/lib/librosidl_typesupport_cpp.so
teste: /opt/ros/foxy/lib/librosidl_typesupport_c.so
teste: /opt/ros/foxy/lib/librcpputils.so
teste: /opt/ros/foxy/lib/librosidl_runtime_c.so
teste: /opt/ros/foxy/lib/librcutils.so
teste: /opt/ros/foxy/lib/libtracetools.so
teste: CMakeFiles/teste.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/otavio/scicobot_rasp/build/teste/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable teste"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/teste.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/teste.dir/build: teste

.PHONY : CMakeFiles/teste.dir/build

CMakeFiles/teste.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/teste.dir/cmake_clean.cmake
.PHONY : CMakeFiles/teste.dir/clean

CMakeFiles/teste.dir/depend:
	cd /home/otavio/scicobot_rasp/build/teste && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/otavio/scicobot_rasp/src/teste /home/otavio/scicobot_rasp/src/teste /home/otavio/scicobot_rasp/build/teste /home/otavio/scicobot_rasp/build/teste /home/otavio/scicobot_rasp/build/teste/CMakeFiles/teste.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/teste.dir/depend

