#!/bin/sh

make || exit 1
make PREFIX=/tools install || exit 1

