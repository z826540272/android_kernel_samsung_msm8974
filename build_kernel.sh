#!/bin/bash

export ARCH=arm
#export CROSS_COMPILE=$(pwd)/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
export CROSS_COMPILE=/home/vilin/UBERTC-arm-eabi-4.9-94cfd739eed6/bin/arm-eabi-

mkdir output

make -C $(pwd) O=output lineage_klte_pn547_defconfig
make -C $(pwd) O=output menuconfig
make -j5 -C $(pwd) O=output
./mkdtb
cp -f output/arch/arm/boot/dt.img .file_out/boot.emmc.win-dt
cp -f output/arch/arm/boot/zImage .file_out/boot.emmc.win-zImage

