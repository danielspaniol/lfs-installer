#!/bin/sh

sed -i '/def add_multiarch_paths/a \        return' setup.py
./configure --prefix=/tools --without-ensurepip

make || exit 1
make install || exit 1

