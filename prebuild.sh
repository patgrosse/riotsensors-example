#!/bin/bash
set -e
cd lib
echo "======= libspt"
if [ ! -d "libspt" ]; then
    echo "------- Using git clone"
    git clone --depth=1 git@gitlab.com:patgrosse/libspt.git libspt
else
    echo "------- Already exists"
fi
echo "======= riotsensors"
if [ ! -d "riotsensors" ]; then
    echo "------- Using git clone"
    git clone --depth=1 git@gitlab.com:patgrosse/riotsensors.git riotsensors
else
    echo "------- Already exists"
fi
echo "======= ARM Toolchain"
if ! type "arm-none-eabi-gcc" &> /dev/null; then
    echo "------- Command not found in path"
    if [ ! -d "gcc-arm-none-eabi-6_2-2016q4" ]; then
        TAR_FILE=gcc-arm-none-eabi-6_2-2016q4-20161216-linux.tar.bz2
        echo "------- Download and unpack"
        if ! [ -f ${TAR_FILE} ]; then
            wget https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/6-2016q4/${TAR_FILE}
        fi
        tar xjf ${TAR_FILE}
    else
        echo "------- Already exists"
    fi
    echo "------- Version check"
    gcc-arm-none-eabi-6_2-2016q4/bin/arm-none-eabi-gcc --version
else
    echo "------- Command found in path"
    echo "------- Version check"
    arm-none-eabi-gcc --version
fi
echo "======= RIOT OS"
if [ ! -d "RIOT" ]; then
    echo "------- Using git clone"
    git clone --depth=1 -b riotsensors https://github.com/patgrosse/RIOT.git RIOT
else
    echo "------- Already exists"
fi
