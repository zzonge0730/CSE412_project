#! /usr/bin/env python3
import glob
import os.path
import sys

tool = sys.argv[1]
opt = sys.argv[2]
benches = ['perlbench', 'bzip2', 'gcc', 'mcf', 'gobmk', 'hmmer', 'sjeng', 'libquantum', 'h264ref', 'milc', 'lbm', 'sphinx3', 'omnetpp', 'astar', 'xalancbmk', 'namd', 'dealII', 'soplex', 'povray']

for bench in benches:
    # print(bench)
    try:
        with open(f'./run/run_{tool}-{opt}_ref/{bench}.log') as f:
            time_mem = f.readlines()[1].strip().split()
            print(f"{time_mem[1]}")
    except:
        print("NULL\tNULL")