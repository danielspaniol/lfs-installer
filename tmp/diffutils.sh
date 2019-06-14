#!/bin/sh

./configure --prefix=/tools

make || exit 1
make install || exit 1
