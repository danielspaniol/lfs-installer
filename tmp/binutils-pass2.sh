#!/bin/sh

mkdir -v build
cd       build

CC=$LFS_TGT-gcc                \
AR=$LFS_TGT-ar                 \
RANLIB=$LFS_TGT-ranlib         \
../configure                   \
    --prefix=/tools            \
    --disable-nls              \
    --disable-werror           \
    --with-lib-path=/tools/lib \
    --with-sysroot

make || exit 1
make install || exit 1

make -C ld clean || exit 1
make -C ld LIB_PATH=/usr/lib:/lib || exit 1
cp -v ld/ld-new /tools/bin


