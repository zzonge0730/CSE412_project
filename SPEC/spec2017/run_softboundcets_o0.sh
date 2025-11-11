#!/bin/bash

export SBCETS_OPTS="-O0"
make clean
make clean-softboundcets 
make output-softboundcets 
make refrate-softboundcets &> softboundcets_o0.log
