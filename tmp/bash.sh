#!/bin/sh

./configure --prefix=/tools --without-bash-malloc

make || exit 1
make install || exit 1

ln -sv bash /tools/bin/sh


