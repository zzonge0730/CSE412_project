# Install script for directory: /workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/3.4/include" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/altivec.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/ammintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/avxintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/avx2intrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/bmiintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/bmi2intrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/emmintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/f16cintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/float.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/fma4intrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/fmaintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/immintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/iso646.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/Intrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/limits.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/lzcntintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/mm3dnow.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/mmintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/mm_malloc.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/nmmintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/pmmintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/popcntintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/prfchwintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/rdseedintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/rtmintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/shaintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/smmintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/stdalign.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/stdarg.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/stdbool.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/stddef.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/stdint.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/stdnoreturn.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/tbmintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/tgmath.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/tmmintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/varargs.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/wmmintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/__wmmintrin_aes.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/__wmmintrin_pclmul.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/x86intrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/xmmintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/xopintrin.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/cpuid.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/unwind.h"
    "/workspace/Catamaran-llvm-3.4.0/llvm/tools/clang/lib/Headers/module.map"
    "/workspace/build-catamaran-3.4.0/lib/clang/3.4/include/arm_neon.h"
    )
endif()

