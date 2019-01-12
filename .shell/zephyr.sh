#!/bin/bash

export GNUARMEMB_TOOLCHAIN_PATH=/usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/
# location=$(which arm-none-eabi-gcc)
# export GNUARMEMB_TOOLCHAIN_PATH="$(dirname $location)/$(dirname $(dirname $(readlink $location)))/"

export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb

old_dir=$(pwd)
# cd /Users/richie/Drive/Eng_18_19/IoT/install_zeph/cs7ns2/zephyr;
# cd /Users/richie/Drive/Documents/College/College/IoT/install_zeph/cs7ns2/zephyr/experimental;
cd /Users/richie/Downloads/install_zeph/cs7ns2/zephyr/experimental;
source zephyr-env.sh;
cd $old_dir
