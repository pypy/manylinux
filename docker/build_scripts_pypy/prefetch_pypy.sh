#!/bin/bash

set -ex

SOURCES=docker/sources
SQUEAKY_BITBUCKET_URL=https://bitbucket.org/squeaky/portable-pypy/downloads # older releases
SQUEAKY_GITHUB_URL=https://github.com/squeaky-pl/portable-pypy/releases/download # old releases
URL=https://bitbucket.org/pypy/pypy/downloads # new releases


MY_DIR=$(dirname "${BASH_SOURCE[0]}")
. $MY_DIR/../build_scripts/build_utils.sh

[ -d "$SOURCES" ] || mkdir "$SOURCES"
cd "$SOURCES"

# pypy 7.1.1
fetch_source pypy-7.1.1-linux_x86_64-portable.tar.bz2 "$SQUEAKY_BITBUCKET_URL"
fetch_source pypy3.6-7.1.1-beta-linux_x86_64-portable.tar.bz2 "$SQUEAKY_BITBUCKET_URL"

# pypy 7.2.0
fetch_source pypy-7.2.0-linux_x86_64-portable.tar.bz2 "$SQUEAKY_GITHUB_URL/pypy-7.2.0"
fetch_source pypy3.6-7.2.0-linux_x86_64-portable.tar.bz2 "$SQUEAKY_GITHUB_URL/pypy3.6-7.2.0"

# pypy 7.3.1
fetch_source pypy2.7-v7.3.1-linux64.tar.bz2 "$URL"
fetch_source pypy3.6-v7.3.1-linux64.tar.bz2 "$URL"
