#!/bin/sh

./configure --prefix=/tools --enable-install-program=hostname
make || exit 1
make install || exit 1

# Needed for user-based package management
# but its does not work...
#cp src/su /tools/bin
 
