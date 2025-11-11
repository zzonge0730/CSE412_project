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

declare -a sb_ctests=(
    "bzip2"
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

declare -a movec_ctests=(
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
declare tests=( "${ctests[@]}" )
# End Configurable items

declare spec2006="${HOME}/code/spec2006"
declare tune="base"
declare run_dir="run/run_${config_name}_${size}"
declare alltests=( "${ctests[@]}" "${cpptests[@]}" )

cd "${spec2006}"
source "${spec2006}/shrc"
mkdir "${run_dir}" -p

# set environment variable
export EFFECTIVE_LOGFILE="${run_dir}/${config_name}.log"
export EFFECTIVE_SINGLETHREADED=1

# build tests
runspec -c ${config_name}.cfg -I -l --size "${size}" "${alltests[@]}" --action clean
runspec -c ${config_name}.cfg -I -l --size "${size}" "${tests[@]}" --action build --rebuild
runspec -c ${config_name}.cfg -I -l --size "${size}" "${tests[@]}" --action setup

# generate script for running benchmarks
for test in "${tests[@]}"
do
    go ${test}
    declare bench_dir=$(pwd)
    declare sh_dir="${spec2006}/${run_dir}/${test}.sh"
    cd ${bench_dir}/run/run_${tune}_${size}_${config_name}.0001
    specinvoke -nn > "${sh_dir}"
    chmod +x  "${sh_dir}"
done


if [[ "${config_name}" == *"movec"* ]]; then
    # running movec for each benchmark
    for test in "${tests[@]}"
    do
        go ${test}
        declare bench_dir=$(pwd)
        declare log="${spec2006}/${run_dir}/${test}.log"
        mkdir -p ${bench_dir}/run/tmp

        cd ${bench_dir}/run/build_${tune}_${config_name}.0001
        make clean
        bear make
        make clean
        movec --check-memsafe -p ${bench_dir}/run/build_${tune}_${config_name}.0001 -d ${bench_dir}/run/tmp -b ${bench_dir}/run/build_${tune}_${config_name}.0001/compile_commands.json >> "${log}" 2>&1
        cd ${bench_dir}/run
        rm -rf ${bench_dir}/run/build_${tune}_${config_name}.0001
        mv ${bench_dir}/run/tmp ${bench_dir}/run/build_${tune}_${config_name}.0001
        cd ${bench_dir}/run/build_${tune}_${config_name}.0001
        make
        cp ${bench_dir}/run/build_${tune}_${config_name}.0001/${test} ${bench_dir}/run/run_${tune}_${size}_${config_name}.0001/${test}_${tune}.${config_name}
    done
if




# running each test
for test in "${tests[@]}"
do
    declare sh="${spec2006}/${run_dir}/${test}.sh"
    declare log="${spec2006}/${run_dir}/${test}.log"
    date >> "${log}"
    /usr/bin/time -f "%e %M" "${sh}" 2>> "${log}"
done

exit 0