#!/bin/bash

exe=$1
path=$2


$exe $path/ref.txt > ref.out 2>> ref.err
