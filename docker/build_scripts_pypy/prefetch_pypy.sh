#!/bin/bash

set -ex

SOURCES=docker/sources
URL=https://bitbucket.org/squeaky/portable-pypy/downloads

MY_DIR=$(dirname "${BASH_SOURCE[0]}")
. $MY_DIR/../build_scripts/build_utils.sh

[ -d "$SOURCES" ] || mkdir "$SOURCES"
cd "$SOURCES"

# pypy 7.1.1
fetch_source pypy-7.1.1-linux_x86_64-portable.tar.bz2 "$URL"
fetch_source pypy3.6-7.1.1-beta-linux_x86_64-portable.tar.bz2 "$URL"
