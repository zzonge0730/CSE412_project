#!/bin/bash

exe=$1
path=$2



$exe --quiet --mode gtp < $path/13x13.tst > 13x13.out 2>> 13x13.err


$exe --quiet --mode gtp < $path/nngs.tst > nngs.out 2>> nngs.err


$exe --quiet --mode gtp < $path/score2.tst > score2.out 2>> score2.err


$exe --quiet --mode gtp < $path/trevorc.tst > trevorc.out 2>> trevorc.err


$exe --quiet --mode gtp < $path/trevord.tst > trevord.out 2>> trevord.err
