#!/bin/bash

export ASAN_OPTS="O0"
make clean
make clean-addresssanitizer
export COMPILER_WRAPPER_ENABLED="true"
export COMPILER_WRAPPER_COMPILER="clang-3.5"
export COMPILER_WRAPPER_OUTPUT_PATH="${HOME}/code/wrapper-output/spec2017-wrapper-asan-${ASAN_OPTS}"
make output-addresssanitizer -j