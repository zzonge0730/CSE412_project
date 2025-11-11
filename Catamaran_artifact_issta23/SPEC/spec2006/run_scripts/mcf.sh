#!/bin/bash

exe=$1
path=$2

$exe $path/inp.in > inp.out 2>> inp.err
