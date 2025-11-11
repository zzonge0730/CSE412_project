#!/bin/bash

exe=$1
path=$2

$exe $path/input.source 280 > input.source.out 2>> input.source.err


$exe $path/chicken.jpg 30 > chicken.jpg.out 2>> chicken.jpg.err


$exe $path/liberty.jpg 30 > liberty.jpg.out 2>> liberty.jpg.err


$exe $path/input.program 280 > input.program.out 2>> input.program.err


$exe $path/text.html 280 > text.html.out 2>> text.html.err


$exe $path/input.combined 200 > input.combined.out 2>> input.combined.err
