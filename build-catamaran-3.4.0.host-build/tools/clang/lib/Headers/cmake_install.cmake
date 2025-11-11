# Install script for directory: /home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/3.4/include" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/altivec.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/ammintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/avxintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/avx2intrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/bmiintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/bmi2intrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/emmintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/f16cintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/float.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/fma4intrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/fmaintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/immintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/iso646.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/Intrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/limits.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/lzcntintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/mm3dnow.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/mmintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/mm_malloc.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/nmmintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/pmmintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/popcntintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/prfchwintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/rdseedintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/rtmintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/shaintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/smmintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/stdalign.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/stdarg.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/stdbool.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/stddef.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/stdint.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/stdnoreturn.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/tbmintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/tgmath.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/tmmintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/varargs.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/wmmintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/__wmmintrin_aes.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/__wmmintrin_pclmul.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/x86intrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/xmmintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/xopintrin.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/cpuid.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/unwind.h"
    "/home/rkddngpr/Catamaran_artifact_issta23/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/module.map"
    "/home/rkddngpr/Catamaran_artifact_issta23/build-catamaran-3.4.0/lib/clang/3.4/include/arm_neon.h"
    )
endif()

