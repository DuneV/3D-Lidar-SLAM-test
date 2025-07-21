# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/workspace/rover/ros2/build/kiss_icp/_deps/sophus-src"
  "/workspace/rover/ros2/build/kiss_icp/_deps/sophus-build"
  "/workspace/rover/ros2/build/kiss_icp/_deps/sophus-subbuild/sophus-populate-prefix"
  "/workspace/rover/ros2/build/kiss_icp/_deps/sophus-subbuild/sophus-populate-prefix/tmp"
  "/workspace/rover/ros2/build/kiss_icp/_deps/sophus-subbuild/sophus-populate-prefix/src/sophus-populate-stamp"
  "/workspace/rover/ros2/build/kiss_icp/_deps/sophus-subbuild/sophus-populate-prefix/src"
  "/workspace/rover/ros2/build/kiss_icp/_deps/sophus-subbuild/sophus-populate-prefix/src/sophus-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/workspace/rover/ros2/build/kiss_icp/_deps/sophus-subbuild/sophus-populate-prefix/src/sophus-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/workspace/rover/ros2/build/kiss_icp/_deps/sophus-subbuild/sophus-populate-prefix/src/sophus-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
