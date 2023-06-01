#!/bin/bash
clear
export ARCH=arm64
mkdir out
BUILD_CROSS_COMPILE=/home/chanz22/Documentos/aosp_aarch64-linux-android-4.9.x-master/bin/aarch64-linux-android-
CLANG_TRIPLE=/home/chanz22/Documentos/aosp_aarch64-linux-android-4.9.x-master/bin/aarch64-linux-android-
KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"
LOG_FILE=compilation.log

make O=out ARCH=arm64 CC=$KERNEL_LLVM_BIN crownqlte_chn_open_defconfig
make O=out ARCH=arm64 \
        CROSS_COMPILE=$BUILD_CROSS_COMPILE CC=$KERNEL_LLVM_BIN \
        CLANG_TRIPLE=$CLANG_TRIPLE -j8 2>&1 |tee ../$LOG_FILE
        
fi
