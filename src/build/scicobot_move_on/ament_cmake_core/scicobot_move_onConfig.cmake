# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_scicobot_move_on_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED scicobot_move_on_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(scicobot_move_on_FOUND FALSE)
  elseif(NOT scicobot_move_on_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(scicobot_move_on_FOUND FALSE)
  endif()
  return()
endif()
set(_scicobot_move_on_CONFIG_INCLUDED TRUE)

# output package information
if(NOT scicobot_move_on_FIND_QUIETLY)
  message(STATUS "Found scicobot_move_on: 0.0.0 (${scicobot_move_on_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'scicobot_move_on' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${scicobot_move_on_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(scicobot_move_on_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${scicobot_move_on_DIR}/${_extra}")
endforeach()
