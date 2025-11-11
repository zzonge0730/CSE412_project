#!/bin/bash

exe=$1
path=$2


$exe --pass 1 --stats $path/x264_stats.log --bitrate 1000 --frames 1000 -o $path/BuckBunny_New.264 $path/BuckBunny.yuv 1280x720 > x264_r_000-1000_pass1.out 2> x264_r_000-1000_pass1.err
$exe --pass 2 --stats $path/x264_stats.log --bitrate 1000 --dumpyuv 200 --frames 1000 -o $path/BuckBunny_New.264 $path/BuckBunny.yuv 1280x720 > x264_r_000-1000_pass2.out 2> x264_r_000-1000_pass2.err
$exe --seek 500 --dumpyuv 200 --frames 1250 -o $path/BuckBunny_New.264 $path/BuckBunny.yuv 1280x720 > x264_r_500-1250.out 2> x264_r_500-1250.err
