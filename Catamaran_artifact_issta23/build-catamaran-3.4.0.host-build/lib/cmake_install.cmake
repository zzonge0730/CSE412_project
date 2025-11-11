# Install script for directory: /home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/lib

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
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/IR/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/IRReader/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/CodeGen/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/Bitcode/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/Transforms/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/Linker/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/Analysis/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/LTO/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/MC/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/Object/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/Option/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/DebugInfo/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/ExecutionEngine/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/Target/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/AsmParser/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/Analyses/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/Tests/cmake_install.cmake")
  include("/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/HydraTransformer/cmake_install.cmake")

endif()

