#!/bin/bash

set -ex

SOURCES=/sources
SQUEAKY_GITHUB_URL=https://github.com/squeaky-pl/portable-pypy/releases/download # old releases
URL=https://downloads.python.org/pypy # new releases


MY_DIR=$(dirname "${BASH_SOURCE[0]}")
. $MY_DIR/../build_scripts/build_utils.sh

mkdir -p "$SOURCES"
cd "$SOURCES"

# pypy 7.2.0
fetch_source pypy-7.2.0-linux_x86_64-portable.tar.bz2 "$SQUEAKY_GITHUB_URL/pypy-7.2.0"
fetch_source pypy3.6-7.2.0-linux_x86_64-portable.tar.bz2 "$SQUEAKY_GITHUB_URL/pypy3.6-7.2.0"

# pypy 7.3.4
fetch_source pypy2.7-v7.3.4-linux64.tar.bz2 "$URL"
fetch_source pypy3.7-v7.3.4-linux64.tar.bz2 "$URL"
