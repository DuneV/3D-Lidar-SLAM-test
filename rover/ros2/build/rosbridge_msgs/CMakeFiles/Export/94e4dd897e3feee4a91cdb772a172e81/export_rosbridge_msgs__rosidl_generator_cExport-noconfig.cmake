#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "rosbridge_msgs::rosbridge_msgs__rosidl_generator_c" for configuration ""
set_property(TARGET rosbridge_msgs::rosbridge_msgs__rosidl_generator_c APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(rosbridge_msgs::rosbridge_msgs__rosidl_generator_c PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/librosbridge_msgs__rosidl_generator_c.so"
  IMPORTED_SONAME_NOCONFIG "librosbridge_msgs__rosidl_generator_c.so"
  )

list(APPEND _cmake_import_check_targets rosbridge_msgs::rosbridge_msgs__rosidl_generator_c )
list(APPEND _cmake_import_check_files_for_rosbridge_msgs::rosbridge_msgs__rosidl_generator_c "${_IMPORT_PREFIX}/lib/librosbridge_msgs__rosidl_generator_c.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
