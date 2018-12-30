#!/bin/bash

fn_abort()
{
    ERRCODE=$?
    echo >&2 "Error $ERRCODE executing $BASH_COMMAND on line ${BASH_LINENO[0]}"
    exit $ERRCODE
}

trap fn_abort ERR
set -o errtrace -o pipefail

fn_build()
{
    BASE_DIR=$1
    NAME=$2
    DIR=$3
    CMAKEARGS=$4
    echo -e " * \\033[1;33m${NAME}\\033[0;39m"
    mkdir "${BASE_DIR}/${DIR}/build"
    cd "${BASE_DIR}/${DIR}/build"
    cmake ${CMAKEARGS} | grep -v -- '-- Detecting C' | grep -v -- '-- Check for working C' | grep -v -- '-- Looking for '
    make
    cd "${BASE_DIR}"
    echo
}

rm -rf cpr
rm -rf src/cpr-1.3.0/build

PWD=`pwd`

fn_build "$PWD" "cpr" "src/cpr-1.3.0" "-DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=11 -DUSE_SYSTEM_CURL=ON -DBUILD_CPR_TESTS=OFF -DCMAKE_INSTALL_PREFIX=../../../cpr .."

mkdir cpr
cp -a src/cpr-1.3.0/include cpr
cp -a src/cpr-1.3.0/build/lib cpr
