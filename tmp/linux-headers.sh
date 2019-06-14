#!/bin/sh

make mrproper
make INSTALL_HDR_PATH=dest headers_install || exit 1
cp -rv dest/include/* /tools/include
