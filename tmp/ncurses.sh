#!/bin/sh

sed -i s/mawk// configure

./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite

make || exit 1
make install || exit 1
ln -s libncursesw.so /tools/lib/libncurses.so

