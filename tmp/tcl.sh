#!/bin/sh

cd unix
./configure --prefix=/tools

make || exit 1
make install || exit 1

chmod -v u+w /tools/lib/libtcl8.6.so
make install-private-headers || exit 1
ln -sv tclsh8.6 /tools/bin/tclsh


