#!/usr/bin/env python3

import glob
import os
import sys

tool = sys.argv[1]
opt = sys.argv[2]


subjects = ["x264", "imagick", "nab", "xz"]


for path in glob.glob(f'./spec2017-wrapper-{tool}-{opt}/**/output-{tool}/', recursive=True):
    os.system(f"rm {path}all_in_one.bc")
    if "asan" not in path:
        os.system(f"llvm-link-3.4 $(find {path} -name '*.ll') -o {path}all_in_one.bc")
    else:
        os.system(f"llvm-link-3.5 $(find {path} -name '*.ll') -o {path}all_in_one.bc")
    for subject in subjects:
        if subject in path:
            if tool == "softboundcets":
                os.system(f"../../build-catamaran-3.4.0/bin/opt -load ../../build-catamaran-3.4.0/lib/libCMPass.so -PDGAnalysis -catamaran-pdg-reaching-analysis -Loops < {path}all_in_one.bc -o CM-SBCETS-{subject}.bc > log.txt 2>&1")
                os.system(f"../../build-catamaran-3.4.0/bin/clang++ -pthread -std=C++11 -DNUM_THREADS=3 CM-SBCETS-{subject}.bc ../../runtime/ThreadPool.cpp -L../../softboundcets-34/softboundcets-lib/ -lsoftboundcets_rt -lm -lrt -o CM-SBCETS-{subject}")
                os.system(f"time sh ./run_scripts/{subject}.sh CM-SBCETS-{subject} ./workload/{subject}/refrate/intput/")
            if tool == "movec":
                os.system(f"../../build-catamaran-3.4.0/bin/opt -load ../../build-catamaran-3.4.0/lib/libCMPass.so -movec -PDGAnalysis -catamaran-pdg-reaching-analysis -LoopsMoveC < {path}all_in_one.bc -o CM-MoveC-{subject}.bc > log.txt 2>&1")
                os.system(f"../../build-catamaran-3.4.0/bin/clang++ -pthread -std=C++11 -DNUM_THREADS=3 CM-MoveC-{subject}.bc ../../runtime/ThreadPool.cpp -o CM-MoveC-{subject}")
                os.system(f"time sh ./run_scripts/{subject}.sh CM-MoveC-{subject} ./workload/{subject}/refrate/intput/")
            if tool == "asan":
                os.system(f"../../build-catamaran-3.5.2/bin/opt -load ../../build-catamaran-3.5.2/lib/libCMPass.so -PDGAnalysis -catamaran-pdg-reaching-analysis -Loops < {path}all_in_one.bc -o CM-ASAN-{subject}.bc > log.txt 2>&1")
                os.system(f"../../build-catamaran-3.5.2/bin/clang++ -fsanitize=address -pthread -std=C++11 -DNUM_THREADS=3 CM-ASAN-{subject}.bc ../../runtime/ThreadPool.cpp -o CM-ASAN-{subject}")
                os.system(f"time sh ./run_scripts/{subject}.sh CM-ASAN-{subject} ./workload/{subject}/refrate/intput/")
            
            break
