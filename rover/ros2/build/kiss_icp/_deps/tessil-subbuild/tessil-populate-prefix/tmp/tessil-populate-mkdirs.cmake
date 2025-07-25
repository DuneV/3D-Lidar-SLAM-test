# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/workspace/rover/ros2/build/kiss_icp/_deps/tessil-src"
  "/workspace/rover/ros2/build/kiss_icp/_deps/tessil-build"
  "/workspace/rover/ros2/build/kiss_icp/_deps/tessil-subbuild/tessil-populate-prefix"
  "/workspace/rover/ros2/build/kiss_icp/_deps/tessil-subbuild/tessil-populate-prefix/tmp"
  "/workspace/rover/ros2/build/kiss_icp/_deps/tessil-subbuild/tessil-populate-prefix/src/tessil-populate-stamp"
  "/workspace/rover/ros2/build/kiss_icp/_deps/tessil-subbuild/tessil-populate-prefix/src"
  "/workspace/rover/ros2/build/kiss_icp/_deps/tessil-subbuild/tessil-populate-prefix/src/tessil-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/workspace/rover/ros2/build/kiss_icp/_deps/tessil-subbuild/tessil-populate-prefix/src/tessil-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/workspace/rover/ros2/build/kiss_icp/_deps/tessil-subbuild/tessil-populate-prefix/src/tessil-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
