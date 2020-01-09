#!/bin/bash

set -ex

SOURCES=docker/sources
BITBUCKET_URL=https://bitbucket.org/squeaky/portable-pypy/downloads # old releases
URL=https://github.com/squeaky-pl/portable-pypy/releases/download # new releases

MY_DIR=$(dirname "${BASH_SOURCE[0]}")
. $MY_DIR/../build_scripts/build_utils.sh

[ -d "$SOURCES" ] || mkdir "$SOURCES"
cd "$SOURCES"

# pypy 7.1.1
fetch_source pypy-7.1.1-linux_x86_64-portable.tar.bz2 "$BITBUCKET_URL"
fetch_source pypy3.6-7.1.1-beta-linux_x86_64-portable.tar.bz2 "$BITBUCKET_URL"

# pypy 7.2.0
fetch_source pypy-7.2.0-linux_x86_64-portable.tar.bz2 "$URL/pypy-7.2.0"
fetch_source pypy3.6-7.2.0-linux_x86_64-portable.tar.bz2 "$URL/pypy3.6-7.2.0"

# pypy 7.3.0
# Since 7.3.0 pypy is building portable binary packages, so we can safely grab them from there
URL=https://bitbucket.org/pypy/pypy/downloads
fetch_source pypy2.7-v7.3.0-linux64.tar.bz2 "$URL"
fetch_source pypy3.6-v7.3.0-linux64.tar.bz2 "$URL"
