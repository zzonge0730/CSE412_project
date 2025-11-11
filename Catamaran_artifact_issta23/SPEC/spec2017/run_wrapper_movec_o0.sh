#!/bin/bash

export MOVEC_OPTS="O0"
make clean
make clean-movec-memsafe
export COMPILER_WRAPPER_ENABLED="true"
export COMPILER_WRAPPER_COMPILER="clang-3.4"
export COMPILER_WRAPPER_OUTPUT_PATH="${HOME}/code/wrapper-output/spec2017-wrapper-movec-${MOVEC_OPTS}"
make output-movec-memsafe -j