#!/bin/sh

cd gettext-tools
EMACS="no" ./configure --prefix=/tools --disable-shared

make -C gnulib-lib || exit 1
make -C intl pluralx.c || exit 1
make -C src msgfmt || exit 1
make -C src msgmerge || exit 1
make -C src xgettext || exit 1

cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin


