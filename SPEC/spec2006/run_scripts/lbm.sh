#!/bin/bash

exe=$1
path=$2


$exe 3000 reference.dat 0 0 $path/100_100_130_ldc.of > lbm.out 2>> lbm.err
