#!/bin/bash

exe=$1
path=$2
$exe < $path/su3imp.in > su3imp.out 2>> su3imp.err
