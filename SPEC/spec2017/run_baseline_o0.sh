#!/bin/bash

make clean
make build
make refrate &> baseline_o0.log
