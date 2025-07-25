# generated from
# ament_cmake_core/cmake/symlink_install/ament_cmake_symlink_install.cmake.in

# create empty symlink install manifest before starting install step
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/symlink_install_manifest.txt")

#
# Reimplement CMake install(DIRECTORY) command to use symlinks instead of
# copying resources.
#
# :param cmake_current_source_dir: The CMAKE_CURRENT_SOURCE_DIR when install
#   was invoked
# :type cmake_current_source_dir: string
# :param ARGN: the same arguments as the CMake install command.
# :type ARGN: various
#
function(ament_cmake_symlink_install_directory cmake_current_source_dir)
  cmake_parse_arguments(ARG "OPTIONAL" "DESTINATION" "DIRECTORY;PATTERN;PATTERN_EXCLUDE" ${ARGN})
  if(ARG_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "ament_cmake_symlink_install_directory() called with "
      "unused/unsupported arguments: ${ARG_UNPARSED_ARGUMENTS}")
  endif()

  # make destination absolute path and ensure that it exists
  if(NOT IS_ABSOLUTE "${ARG_DESTINATION}")
    set(ARG_DESTINATION "/workspace/rover/ros2/install/rosapi_msgs/${ARG_DESTINATION}")
  endif()
  if(NOT EXISTS "${ARG_DESTINATION}")
    file(MAKE_DIRECTORY "${ARG_DESTINATION}")
  endif()

  # default pattern to include
  if(NOT ARG_PATTERN)
    set(ARG_PATTERN "*")
  endif()

  # iterate over directories
  foreach(dir ${ARG_DIRECTORY})
    # make dir an absolute path
    if(NOT IS_ABSOLUTE "${dir}")
      set(dir "${cmake_current_source_dir}/${dir}")
    endif()

    if(EXISTS "${dir}")
      # if directory has no trailing slash
      # append folder name to destination
      set(destination "${ARG_DESTINATION}")
      string(LENGTH "${dir}" length)
      math(EXPR offset "${length} - 1")
      string(SUBSTRING "${dir}" ${offset} 1 dir_last_char)
      if(NOT dir_last_char STREQUAL "/")
        get_filename_component(destination_name "${dir}" NAME)
        set(destination "${destination}/${destination_name}")
      else()
        # remove trailing slash
        string(SUBSTRING "${dir}" 0 ${offset} dir)
      endif()

      # glob recursive files
      set(relative_files "")
      foreach(pattern ${ARG_PATTERN})
        file(
          GLOB_RECURSE
          include_files
          RELATIVE "${dir}"
          "${dir}/${pattern}"
        )
        if(NOT include_files STREQUAL "")
          list(APPEND relative_files ${include_files})
        endif()
      endforeach()
      foreach(pattern ${ARG_PATTERN_EXCLUDE})
        file(
          GLOB_RECURSE
          exclude_files
          RELATIVE "${dir}"
          "${dir}/${pattern}"
        )
        if(NOT exclude_files STREQUAL "")
          list(REMOVE_ITEM relative_files ${exclude_files})
        endif()
      endforeach()
      list(SORT relative_files)

      foreach(relative_file ${relative_files})
        set(absolute_file "${dir}/${relative_file}")
        # determine link name for file including destination path
        set(symlink "${destination}/${relative_file}")

        # ensure that destination exists
        get_filename_component(symlink_dir "${symlink}" PATH)
        if(NOT EXISTS "${symlink_dir}")
          file(MAKE_DIRECTORY "${symlink_dir}")
        endif()

        _ament_cmake_symlink_install_create_symlink("${absolute_file}" "${symlink}")
      endforeach()
    else()
      if(NOT ARG_OPTIONAL)
        message(FATAL_ERROR
          "ament_cmake_symlink_install_directory() can't find '${dir}'")
      endif()
    endif()
  endforeach()
endfunction()

#
# Reimplement CMake install(FILES) command to use symlinks instead of copying
# resources.
#
# :param cmake_current_source_dir: The CMAKE_CURRENT_SOURCE_DIR when install
#   was invoked
# :type cmake_current_source_dir: string
# :param ARGN: the same arguments as the CMake install command.
# :type ARGN: various
#
function(ament_cmake_symlink_install_files cmake_current_source_dir)
  cmake_parse_arguments(ARG "OPTIONAL" "DESTINATION;RENAME" "FILES" ${ARGN})
  if(ARG_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "ament_cmake_symlink_install_files() called with "
      "unused/unsupported arguments: ${ARG_UNPARSED_ARGUMENTS}")
  endif()

  # make destination an absolute path and ensure that it exists
  if(NOT IS_ABSOLUTE "${ARG_DESTINATION}")
    set(ARG_DESTINATION "/workspace/rover/ros2/install/rosapi_msgs/${ARG_DESTINATION}")
  endif()
  if(NOT EXISTS "${ARG_DESTINATION}")
    file(MAKE_DIRECTORY "${ARG_DESTINATION}")
  endif()

  if(ARG_RENAME)
    list(LENGTH ARG_FILES file_count)
    if(NOT file_count EQUAL 1)
    message(FATAL_ERROR "ament_cmake_symlink_install_files() called with "
      "RENAME argument but not with a single file")
    endif()
  endif()

  # iterate over files
  foreach(file ${ARG_FILES})
    # make file an absolute path
    if(NOT IS_ABSOLUTE "${file}")
      set(file "${cmake_current_source_dir}/${file}")
    endif()

    if(EXISTS "${file}")
      # determine link name for file including destination path
      get_filename_component(filename "${file}" NAME)
      if(NOT ARG_RENAME)
        set(symlink "${ARG_DESTINATION}/${filename}")
      else()
        set(symlink "${ARG_DESTINATION}/${ARG_RENAME}")
      endif()
      _ament_cmake_symlink_install_create_symlink("${file}" "${symlink}")
    else()
      if(NOT ARG_OPTIONAL)
        message(FATAL_ERROR
          "ament_cmake_symlink_install_files() can't find '${file}'")
      endif()
    endif()
  endforeach()
endfunction()

#
# Reimplement CMake install(PROGRAMS) command to use symlinks instead of copying
# resources.
#
# :param cmake_current_source_dir: The CMAKE_CURRENT_SOURCE_DIR when install
#   was invoked
# :type cmake_current_source_dir: string
# :param ARGN: the same arguments as the CMake install command.
# :type ARGN: various
#
function(ament_cmake_symlink_install_programs cmake_current_source_dir)
  cmake_parse_arguments(ARG "OPTIONAL" "DESTINATION" "PROGRAMS" ${ARGN})
  if(ARG_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "ament_cmake_symlink_install_programs() called with "
      "unused/unsupported arguments: ${ARG_UNPARSED_ARGUMENTS}")
  endif()

  # make destination an absolute path and ensure that it exists
  if(NOT IS_ABSOLUTE "${ARG_DESTINATION}")
    set(ARG_DESTINATION "/workspace/rover/ros2/install/rosapi_msgs/${ARG_DESTINATION}")
  endif()
  if(NOT EXISTS "${ARG_DESTINATION}")
    file(MAKE_DIRECTORY "${ARG_DESTINATION}")
  endif()

  # iterate over programs
  foreach(file ${ARG_PROGRAMS})
    # make file an absolute path
    if(NOT IS_ABSOLUTE "${file}")
      set(file "${cmake_current_source_dir}/${file}")
    endif()

    if(EXISTS "${file}")
      # determine link name for file including destination path
      get_filename_component(filename "${file}" NAME)
      set(symlink "${ARG_DESTINATION}/${filename}")
      _ament_cmake_symlink_install_create_symlink("${file}" "${symlink}")
    else()
      if(NOT ARG_OPTIONAL)
        message(FATAL_ERROR
          "ament_cmake_symlink_install_programs() can't find '${file}'")
      endif()
    endif()
  endforeach()
endfunction()

#
# Reimplement CMake install(TARGETS) command to use symlinks instead of copying
# resources.
#
# :param TARGET_FILES: the absolute files, replacing the name of targets passed
#   in as TARGETS
# :type TARGET_FILES: list of files
# :param ARGN: the same arguments as the CMake install command except that
#   keywords identifying the kind of type and the DESTINATION keyword must be
#   joined with an underscore, e.g. ARCHIVE_DESTINATION.
# :type ARGN: various
#
function(ament_cmake_symlink_install_targets)
  cmake_parse_arguments(ARG "OPTIONAL" "ARCHIVE_DESTINATION;DESTINATION;LIBRARY_DESTINATION;RUNTIME_DESTINATION"
    "TARGETS;TARGET_FILES" ${ARGN})
  if(ARG_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "ament_cmake_symlink_install_targets() called with "
      "unused/unsupported arguments: ${ARG_UNPARSED_ARGUMENTS}")
  endif()

  # iterate over target files
  foreach(file ${ARG_TARGET_FILES})
    if(NOT IS_ABSOLUTE "${file}")
      message(FATAL_ERROR "ament_cmake_symlink_install_targets() target file "
        "'${file}' must be an absolute path")
    endif()

    # determine destination of file based on extension
    set(destination "")
    get_filename_component(fileext "${file}" EXT)
    if(fileext STREQUAL ".a" OR fileext STREQUAL ".lib")
      set(destination "${ARG_ARCHIVE_DESTINATION}")
    elseif(fileext STREQUAL ".dylib" OR fileext MATCHES "\\.so(\\.[0-9]+)?(\\.[0-9]+)?(\\.[0-9]+)?$")
      set(destination "${ARG_LIBRARY_DESTINATION}")
    elseif(fileext STREQUAL "" OR fileext STREQUAL ".dll" OR fileext STREQUAL ".exe")
      set(destination "${ARG_RUNTIME_DESTINATION}")
    endif()
    if(destination STREQUAL "")
      set(destination "${ARG_DESTINATION}")
    endif()

    # make destination an absolute path and ensure that it exists
    if(NOT IS_ABSOLUTE "${destination}")
      set(destination "/workspace/rover/ros2/install/rosapi_msgs/${destination}")
    endif()
    if(NOT EXISTS "${destination}")
      file(MAKE_DIRECTORY "${destination}")
    endif()

    if(EXISTS "${file}")
      # determine link name for file including destination path
      get_filename_component(filename "${file}" NAME)
      set(symlink "${destination}/${filename}")
      _ament_cmake_symlink_install_create_symlink("${file}" "${symlink}")
    else()
      if(NOT ARG_OPTIONAL)
        message(FATAL_ERROR
          "ament_cmake_symlink_install_targets() can't find '${file}'")
      endif()
    endif()
  endforeach()
endfunction()

function(_ament_cmake_symlink_install_create_symlink absolute_file symlink)
  # register symlink for being removed during install step
  file(APPEND "${CMAKE_CURRENT_BINARY_DIR}/symlink_install_manifest.txt"
    "${symlink}\n")

  # avoid any work if correct symlink is already in place
  if(EXISTS "${symlink}" AND IS_SYMLINK "${symlink}")
    get_filename_component(destination "${symlink}" REALPATH)
    get_filename_component(real_absolute_file "${absolute_file}" REALPATH)
    if(destination STREQUAL real_absolute_file)
      message(STATUS "Up-to-date symlink: ${symlink}")
      return()
    endif()
  endif()

  message(STATUS "Symlinking: ${symlink}")
  if(EXISTS "${symlink}" OR IS_SYMLINK "${symlink}")
    file(REMOVE "${symlink}")
  endif()

  execute_process(
    COMMAND "/usr/local/bin/cmake" "-E" "create_symlink"
      "${absolute_file}"
      "${symlink}"
  )
  # the CMake command does not provide a return code so check manually
  if(NOT EXISTS "${symlink}" OR NOT IS_SYMLINK "${symlink}")
    get_filename_component(destination "${symlink}" REALPATH)
    message(FATAL_ERROR
      "Could not create symlink '${symlink}' pointing to '${absolute_file}'")
  endif()
endfunction()

# end of template

message(STATUS "Execute custom install script")

# begin of custom install code

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_index/share/ament_index/resource_index/rosidl_interfaces/rosapi_msgs" "DESTINATION" "share/ament_index/resource_index/rosidl_interfaces")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_index/share/ament_index/resource_index/rosidl_interfaces/rosapi_msgs" "DESTINATION" "share/ament_index/resource_index/rosidl_interfaces")

# install(DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_generator_c/rosapi_msgs/" "DESTINATION" "include/rosapi_msgs/rosapi_msgs" "PATTERN" "*.h")
ament_cmake_symlink_install_directory("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_generator_c/rosapi_msgs/" "DESTINATION" "include/rosapi_msgs/rosapi_msgs" "PATTERN" "*.h")

# install(FILES "/opt/ros/humble/lib/python3.10/site-packages/ament_package/template/environment_hook/library_path.sh" "DESTINATION" "share/rosapi_msgs/environment")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/opt/ros/humble/lib/python3.10/site-packages/ament_package/template/environment_hook/library_path.sh" "DESTINATION" "share/rosapi_msgs/environment")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/library_path.dsv" "DESTINATION" "share/rosapi_msgs/environment")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/library_path.dsv" "DESTINATION" "share/rosapi_msgs/environment")

# install(DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_typesupport_fastrtps_c/rosapi_msgs/" "DESTINATION" "include/rosapi_msgs/rosapi_msgs" "PATTERN_EXCLUDE" "*.cpp")
ament_cmake_symlink_install_directory("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_typesupport_fastrtps_c/rosapi_msgs/" "DESTINATION" "include/rosapi_msgs/rosapi_msgs" "PATTERN_EXCLUDE" "*.cpp")

# install(DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_generator_cpp/rosapi_msgs/" "DESTINATION" "include/rosapi_msgs/rosapi_msgs" "PATTERN" "*.hpp")
ament_cmake_symlink_install_directory("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_generator_cpp/rosapi_msgs/" "DESTINATION" "include/rosapi_msgs/rosapi_msgs" "PATTERN" "*.hpp")

# install(DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_typesupport_fastrtps_cpp/rosapi_msgs/" "DESTINATION" "include/rosapi_msgs/rosapi_msgs" "PATTERN_EXCLUDE" "*.cpp")
ament_cmake_symlink_install_directory("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_typesupport_fastrtps_cpp/rosapi_msgs/" "DESTINATION" "include/rosapi_msgs/rosapi_msgs" "PATTERN_EXCLUDE" "*.cpp")

# install(DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_typesupport_introspection_c/rosapi_msgs/" "DESTINATION" "include/rosapi_msgs/rosapi_msgs" "PATTERN" "*.h")
ament_cmake_symlink_install_directory("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_typesupport_introspection_c/rosapi_msgs/" "DESTINATION" "include/rosapi_msgs/rosapi_msgs" "PATTERN" "*.h")

# install(DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_typesupport_introspection_cpp/rosapi_msgs/" "DESTINATION" "include/rosapi_msgs/rosapi_msgs" "PATTERN" "*.hpp")
ament_cmake_symlink_install_directory("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_typesupport_introspection_cpp/rosapi_msgs/" "DESTINATION" "include/rosapi_msgs/rosapi_msgs" "PATTERN" "*.hpp")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/pythonpath.sh" "DESTINATION" "share/rosapi_msgs/environment")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/pythonpath.sh" "DESTINATION" "share/rosapi_msgs/environment")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/pythonpath.dsv" "DESTINATION" "share/rosapi_msgs/environment")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/pythonpath.dsv" "DESTINATION" "share/rosapi_msgs/environment")

# install(DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_python/rosapi_msgs/rosapi_msgs.egg-info/" "DESTINATION" "local/lib/python3.10/dist-packages/rosapi_msgs-2.3.0-py3.10.egg-info")
ament_cmake_symlink_install_directory("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_python/rosapi_msgs/rosapi_msgs.egg-info/" "DESTINATION" "local/lib/python3.10/dist-packages/rosapi_msgs-2.3.0-py3.10.egg-info")

# install(DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_generator_py/rosapi_msgs/" "DESTINATION" "local/lib/python3.10/dist-packages/rosapi_msgs" "PATTERN_EXCLUDE" "*.pyc" "PATTERN_EXCLUDE" "__pycache__")
ament_cmake_symlink_install_directory("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" DIRECTORY "/workspace/rover/ros2/build/rosapi_msgs/rosidl_generator_py/rosapi_msgs/" "DESTINATION" "local/lib/python3.10/dist-packages/rosapi_msgs" "PATTERN_EXCLUDE" "*.pyc" "PATTERN_EXCLUDE" "__pycache__")

# install("TARGETS" "rosapi_msgs__rosidl_typesupport_fastrtps_c__pyext" "DESTINATION" "local/lib/python3.10/dist-packages/rosapi_msgs")
include("/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_symlink_install_targets_0_${CMAKE_INSTALL_CONFIG_NAME}.cmake")

# install("TARGETS" "rosapi_msgs__rosidl_typesupport_introspection_c__pyext" "DESTINATION" "local/lib/python3.10/dist-packages/rosapi_msgs")
include("/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_symlink_install_targets_1_${CMAKE_INSTALL_CONFIG_NAME}.cmake")

# install("TARGETS" "rosapi_msgs__rosidl_typesupport_c__pyext" "DESTINATION" "local/lib/python3.10/dist-packages/rosapi_msgs")
include("/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_symlink_install_targets_2_${CMAKE_INSTALL_CONFIG_NAME}.cmake")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/msg/TypeDef.idl" "DESTINATION" "share/rosapi_msgs/msg")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/msg/TypeDef.idl" "DESTINATION" "share/rosapi_msgs/msg")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/DeleteParam.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/DeleteParam.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/GetActionServers.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/GetActionServers.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/GetParam.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/GetParam.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/GetParamNames.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/GetParamNames.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/GetROSVersion.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/GetROSVersion.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/GetTime.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/GetTime.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/HasParam.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/HasParam.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/Interfaces.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/Interfaces.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/MessageDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/MessageDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/Nodes.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/Nodes.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/NodeDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/NodeDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/Publishers.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/Publishers.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ServiceNode.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ServiceNode.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ServiceProviders.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ServiceProviders.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ServiceRequestDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ServiceRequestDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ServiceResponseDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ServiceResponseDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ActionGoalDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ActionGoalDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ActionResultDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ActionResultDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ActionFeedbackDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ActionFeedbackDetails.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ActionType.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ActionType.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/Services.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/Services.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ServicesForType.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ServicesForType.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ServiceType.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/ServiceType.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/SetParam.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/SetParam.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/Subscribers.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/Subscribers.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/Topics.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/Topics.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/TopicsAndRawTypes.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/TopicsAndRawTypes.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/TopicsForType.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/TopicsForType.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/TopicType.idl" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_adapter/rosapi_msgs/srv/TopicType.idl" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/msg/TypeDef.msg" "DESTINATION" "share/rosapi_msgs/msg")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/msg/TypeDef.msg" "DESTINATION" "share/rosapi_msgs/msg")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/DeleteParam.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/DeleteParam.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/DeleteParam_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/DeleteParam_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/DeleteParam_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/DeleteParam_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/GetActionServers.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/GetActionServers.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetActionServers_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetActionServers_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetActionServers_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetActionServers_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/GetParam.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/GetParam.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetParam_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetParam_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetParam_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetParam_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/GetParamNames.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/GetParamNames.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetParamNames_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetParamNames_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetParamNames_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetParamNames_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/GetROSVersion.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/GetROSVersion.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetROSVersion_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetROSVersion_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetROSVersion_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetROSVersion_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/GetTime.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/GetTime.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetTime_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetTime_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetTime_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/GetTime_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/HasParam.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/HasParam.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/HasParam_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/HasParam_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/HasParam_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/HasParam_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/Interfaces.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/Interfaces.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Interfaces_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Interfaces_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Interfaces_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Interfaces_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/MessageDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/MessageDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/MessageDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/MessageDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/MessageDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/MessageDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/Nodes.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/Nodes.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Nodes_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Nodes_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Nodes_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Nodes_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/NodeDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/NodeDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/NodeDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/NodeDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/NodeDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/NodeDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/Publishers.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/Publishers.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Publishers_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Publishers_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Publishers_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Publishers_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ServiceNode.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ServiceNode.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceNode_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceNode_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceNode_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceNode_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ServiceProviders.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ServiceProviders.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceProviders_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceProviders_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceProviders_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceProviders_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ServiceRequestDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ServiceRequestDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceRequestDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceRequestDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceRequestDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceRequestDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ServiceResponseDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ServiceResponseDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceResponseDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceResponseDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceResponseDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceResponseDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ActionGoalDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ActionGoalDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionGoalDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionGoalDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionGoalDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionGoalDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ActionResultDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ActionResultDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionResultDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionResultDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionResultDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionResultDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ActionFeedbackDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ActionFeedbackDetails.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionFeedbackDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionFeedbackDetails_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionFeedbackDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionFeedbackDetails_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ActionType.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ActionType.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionType_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionType_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionType_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ActionType_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/Services.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/Services.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Services_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Services_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Services_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Services_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ServicesForType.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ServicesForType.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServicesForType_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServicesForType_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServicesForType_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServicesForType_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ServiceType.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/ServiceType.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceType_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceType_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceType_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/ServiceType_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/SetParam.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/SetParam.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/SetParam_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/SetParam_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/SetParam_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/SetParam_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/Subscribers.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/Subscribers.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Subscribers_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Subscribers_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Subscribers_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Subscribers_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/Topics.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/Topics.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Topics_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Topics_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Topics_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/Topics_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/TopicsAndRawTypes.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/TopicsAndRawTypes.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/TopicsAndRawTypes_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/TopicsAndRawTypes_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/TopicsAndRawTypes_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/TopicsAndRawTypes_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/TopicsForType.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/TopicsForType.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/TopicsForType_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/TopicsForType_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/TopicsForType_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/TopicsForType_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/TopicType.srv" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/srv/TopicType.srv" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/TopicType_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/TopicType_Request.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/TopicType_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/srv/TopicType_Response.msg" "DESTINATION" "share/rosapi_msgs/srv")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/rosapi_msgs" "DESTINATION" "share/ament_index/resource_index/package_run_dependencies")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/rosapi_msgs" "DESTINATION" "share/ament_index/resource_index/package_run_dependencies")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/rosapi_msgs" "DESTINATION" "share/ament_index/resource_index/parent_prefix_path")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/rosapi_msgs" "DESTINATION" "share/ament_index/resource_index/parent_prefix_path")

# install(FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh" "DESTINATION" "share/rosapi_msgs/environment")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh" "DESTINATION" "share/rosapi_msgs/environment")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/ament_prefix_path.dsv" "DESTINATION" "share/rosapi_msgs/environment")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/ament_prefix_path.dsv" "DESTINATION" "share/rosapi_msgs/environment")

# install(FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh" "DESTINATION" "share/rosapi_msgs/environment")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh" "DESTINATION" "share/rosapi_msgs/environment")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/path.dsv" "DESTINATION" "share/rosapi_msgs/environment")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/path.dsv" "DESTINATION" "share/rosapi_msgs/environment")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/local_setup.bash" "DESTINATION" "share/rosapi_msgs")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/local_setup.bash" "DESTINATION" "share/rosapi_msgs")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/local_setup.sh" "DESTINATION" "share/rosapi_msgs")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/local_setup.sh" "DESTINATION" "share/rosapi_msgs")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/local_setup.zsh" "DESTINATION" "share/rosapi_msgs")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/local_setup.zsh" "DESTINATION" "share/rosapi_msgs")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/local_setup.dsv" "DESTINATION" "share/rosapi_msgs")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/local_setup.dsv" "DESTINATION" "share/rosapi_msgs")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/package.dsv" "DESTINATION" "share/rosapi_msgs")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_environment_hooks/package.dsv" "DESTINATION" "share/rosapi_msgs")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_index/share/ament_index/resource_index/packages/rosapi_msgs" "DESTINATION" "share/ament_index/resource_index/packages")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_index/share/ament_index/resource_index/packages/rosapi_msgs" "DESTINATION" "share/ament_index/resource_index/packages")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/rosidl_cmake-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/rosidl_cmake-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_export_dependencies/ament_cmake_export_dependencies-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_export_dependencies/ament_cmake_export_dependencies-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_export_include_directories/ament_cmake_export_include_directories-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_export_include_directories/ament_cmake_export_include_directories-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_export_libraries/ament_cmake_export_libraries-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_export_libraries/ament_cmake_export_libraries-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_export_targets/ament_cmake_export_targets-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_export_targets/ament_cmake_export_targets-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/rosidl_cmake_export_typesupport_targets-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/rosidl_cmake_export_typesupport_targets-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/rosidl_cmake_export_typesupport_libraries-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/rosidl_cmake/rosidl_cmake_export_typesupport_libraries-extras.cmake" "DESTINATION" "share/rosapi_msgs/cmake")

# install(FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_core/rosapi_msgsConfig.cmake" "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_core/rosapi_msgsConfig-version.cmake" "DESTINATION" "share/rosapi_msgs/cmake")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_core/rosapi_msgsConfig.cmake" "/workspace/rover/ros2/build/rosapi_msgs/ament_cmake_core/rosapi_msgsConfig-version.cmake" "DESTINATION" "share/rosapi_msgs/cmake")

# install(FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/package.xml" "DESTINATION" "share/rosapi_msgs")
ament_cmake_symlink_install_files("/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs" FILES "/workspace/rover/ros2/src/rosbridge_suite/rosapi_msgs/package.xml" "DESTINATION" "share/rosapi_msgs")
