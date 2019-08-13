#!/bin/sh

./configure --prefix=/tools --enable-install-program=hostname
make 
make install 

# Needed for user-based package management
# but its does not work...
#cp src/su /tools/bin
 
