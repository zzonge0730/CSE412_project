#!/bin/bash

export ASAN_OPTS="-O0"
make clean
make clean-addresssanitizer
make output-addresssanitizer
make refrate-addresssanitizer &> asan_o0.log
