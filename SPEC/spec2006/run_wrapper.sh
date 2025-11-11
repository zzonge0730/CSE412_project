#!/bin/bash

declare -a ctests=(
    "perlbench"
    "bzip2"
    "gcc"
    "mcf"
    "gobmk"
    "hmmer"
    "sjeng"
    "libquantum"
    "h264ref"
    "milc"
    "lbm"
    "sphinx3"
)

declare -a cpptests=(
    "omnetpp"
    "astar"
    "xalancbmk"
    "namd"
    "dealII"
    "soplex"
    "povray"
)

# Begin Configurable items
declare config_name="$1"
if [[ -z ${config_name} ]]; then
  printf "Error, config_name not specified\n"
  exit -1
fi
declare size="ref"
declare tests=( "${ctests[@]}" "${cpptests[@]}" )
# End Configurable items

declare spec2006="${HOME}/code/spec2006"
declare tune="base"
declare run_dir="run/run_${config_name}_${size}"

cd "${spec2006}"
source "${spec2006}/shrc"
mkdir "${run_dir}" -p

# cleanup
runspec -c ${config_name}.cfg -I -l --size "${size}" "${tests[@]}" --action clean

export COMPILER_WRAPPER_ENABLED="true"
export COMPILER_WRAPPER_OUTPUT_PATH="${HOME}/code/wrapper-output/${config_name}"

# build c tests
export COMPILER_WRAPPER_COMPILER="clang-3.4"
runspec -c ${config_name}.cfg -I -l --size "${size}" "${ctests[@]}" --action build --rebuild
runspec -c ${config_name}.cfg -I -l --size "${size}" "${ctests[@]}" --action setup
unset COMPILER_WRAPPER_COMPILER

# # build cpp tests
# export COMPILER_WRAPPER_COMPILER="clang++-3.4"
# runspec -c ${config_name}.cfg -I -l --size "${size}" "${cpptests[@]}" --action build --rebuild
# runspec -c ${config_name}.cfg -I -l --size "${size}" "${cpptests[@]}" --action setup
# unset COMPILER_WRAPPER_COMPILER

# # generate script for running benchmarks
# for test in "${tests[@]}"
# do
#     go ${test}
#     declare bench_dir=$(pwd)
#     declare sh_dir="${spec2006}/${run_dir}/${test}.sh"
#     cd ${bench_dir}/run/run_${tune}_${size}_${config_name}.0001
#     specinvoke -nn > "${sh_dir}"
#     chmod +x  "${sh_dir}"
# done

# # running each test
# for test in "${tests[@]}"
# do
#     declare sh="${spec2006}/${run_dir}/${test}.sh"
#     declare log="${spec2006}/${run_dir}/${test}.log"
#     date >> "${log}"
#     /usr/bin/time -f "%e %M" "${sh}" 2>> "${log}"
# done

exit 0