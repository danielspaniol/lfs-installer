#!/bin/sh

set -o errexit
set -o pipefail
set -o nounset

make INSTALL_HDR_PATH=dest headers_install
find dest/include \( -name .install -o -name ..install.cmd \) -delete
cp -rv dest/include/* /usr/include
