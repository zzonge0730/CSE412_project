#!/bin/bash

exe=$1
path=$2

$exe -limit disk 0 $path/refrate_input.tga -edge 41 -resample 181% -emboss 31 -colorspace YUV -mean-shift 19x19+15% -resize 30% $path/refrate_output.tga > refrate_convert.out 2> refrate_convert.err

