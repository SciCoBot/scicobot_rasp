cmake_minimum_required(VERSION 3.5)
project(test_cooperation_scicobot)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)
  
add_executable(cooperation_scicobot src/test_cooperation_scicobot.cpp)
ament_target_dependencies(cooperation_scicobot rclcpp std_msgs)

install(TARGETS
  cooperation_scicobot
  DESTINATION lib/${PROJECT_NAME})

ament_package()
