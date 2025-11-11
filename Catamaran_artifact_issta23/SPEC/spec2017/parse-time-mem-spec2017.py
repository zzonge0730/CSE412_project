#! /usr/bin/env python3
import glob
import os.path
import sys

tool = sys.argv[1]
opt = sys.argv[2]
benches = ['mcf', 'lbm', 'x264', 'imagick', 'nab', 'xz']
for bench in benches:
    try:
        with open(f'./{tool}_{opt}.log') as f:
            lines = f.readlines()
            # skip pred
            for i in range(len(lines)):
                if bench in lines[i]:
                    lines = lines[i:]
                    break
            for i in range(len(lines)):
                if "time (seconds):" in lines[i]:
                    #print(lines[i].split()[-1])
                    print(lines[i+1].split()[-1])
                    break

    except:
        print("NULL\tNULL")