#!/bin/bash

set -ex

function install_one_pypy {
    local tarball=$1

    mkdir -p /opt/pypy
    cd /opt/pypy
    tar xf $tarball
}

for PYPY in /pypy*.tar.bz2
do
    install_one_pypy "$PYPY"
done
