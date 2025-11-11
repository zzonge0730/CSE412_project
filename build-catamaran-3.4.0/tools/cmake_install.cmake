# Install script for directory: /workspace/Catamaran-llvm-3.4.0/llvm/tools

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/workspace/build-catamaran-3.4.0/tools/llvm-config/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/opt/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-as/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-dis/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-mc/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llc/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-ar/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-nm/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-size/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-cov/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-link/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/lli/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-extract/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-diff/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/macho-dump/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-objdump/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-readobj/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-rtdyld/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-dwarfdump/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/bugpoint/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/bugpoint-passes/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-bcanalyzer/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-stress/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-mcmarkup/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-symbolizer/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-c-test/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/obj2yaml/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/yaml2obj/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/lto/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/llvm-lto/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/gold/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/clang/cmake_install.cmake")
  include("/workspace/build-catamaran-3.4.0/tools/msbuild/cmake_install.cmake")

endif()

