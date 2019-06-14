#!/bin/sh

./configure --prefix=/tools
make install || exit 1
