#!/bin/bash

exe=$1
path=$2



$exe $path/166.i -o 166.s > 166.out 2>> 166.err


$exe $path/200.i -o 200.s > 200.out 2>> 200.err


$exe $path/c-typeck.i -o c-typeck.s > c-typeck.out 2>> c-typeck.err


$exe $path/cp-decl.i -o cp-decl.s > cp-decl.out 2>> cp-decl.err


$exe $path/expr.i -o expr.s > expr.out 2>> expr.err


$exe $path/expr2.i -o expr2.s > expr2.out 2>> expr2.err


$exe $path/g23.i -o g23.s > g23.out 2>> g23.err


$exe $path/s04.i -o s04.s > s04.out 2>> s04.err


$exe $path/scilab.i -o scilab.s > scilab.out 2>> scilab.err
