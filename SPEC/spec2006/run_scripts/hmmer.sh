#!/bin/bash

exe=$1
path=$2


$exe $path/nph3.hmm swiss41 > nph3.out 2>> nph3.err


$exe --fixed 0 --mean 500 --num 500000 --sd 350 --seed 0 $path/retro.hmm > retro.out 2>> retro.err
