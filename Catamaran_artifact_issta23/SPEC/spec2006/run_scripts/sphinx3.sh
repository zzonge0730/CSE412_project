#!/bin/bash

exe=$1
path=$2

$exe $path/ctlfile $path/ args.an4 > an4.log 2>> an4.err
