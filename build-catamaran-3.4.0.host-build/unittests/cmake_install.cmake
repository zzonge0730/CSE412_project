# Install script for directory: /home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/unittests

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/unittests/ADT/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/unittests/Analysis/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/unittests/Bitcode/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/unittests/CodeGen/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/unittests/DebugInfo/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/unittests/ExecutionEngine/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/unittests/IR/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/unittests/MC/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/unittests/Object/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/unittests/Option/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/unittests/Support/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/unittests/Transforms/cmake_install.cmake")

endif()

