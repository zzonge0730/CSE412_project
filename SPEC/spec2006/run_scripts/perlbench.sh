#!/bin/bash

exe=$1
path=$2

$exe -I$path/lib $path/checkspam.pl 2500 5 25 11 150 1 1 1 1 > checkspam.2500.5.25.11.150.1.1.1.1.out 2>> checkspam.2500.5.25.11.150.1.1.1.1.err

$exe -I$path/lib $path/diffmail.pl 4 800 10 17 19 300 > diffmail.4.800.10.17.19.300.out 2>> diffmail.4.800.10.17.19.300.err

$exe -I$path/lib $path/splitmail.pl 1600 12 26 16 4500 > splitmail.1600.12.26.16.4500.out 2>> splitmail.1600.12.26.16.4500.err
