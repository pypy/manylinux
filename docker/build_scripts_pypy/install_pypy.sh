#!/bin/bash

set -ex

function get_shortdir {
    local exe=$1
    $exe -c 'import sys; print("pypy%d.%d-%d.%d.%d" % (sys.version_info[:2]+sys.pypy_version_info[:3]))'
}

# this is more or less equivalent to do_cpython_build, although we download a
# prebuilt pypy instead of building it from scratch
function install_one_pypy {
    local tarball=$1
    local basename=$(basename $tarball)
    local outdir=/opt/pypy/${basename/.tar.bz2//}

    mkdir -p /opt/pypy
    cd /opt/pypy
    tar xf $tarball

    # rename the directory to something shorter like pypy2.7-7.1.1
    shortdir=$(get_shortdir $outdir/bin/pypy)
    mv "$outdir" "$shortdir"
    local pypy=$shortdir/bin/pypy

    # remove debug symbols
    rm $shortdir/bin/*.debug

    # install and upgrade pip
    $pypy -m ensurepip
    $pypy -m pip install -U --require-hashes -r /build_scripts/requirements.txt

    local abi_tag=$($pypy /build_scripts/python-tag-abi-tag.py)
    ln -s /opt/pypy/$shortdir /opt/python/${abi_tag}
}

for PYPY in /pypy*.tar.bz2
do
    install_one_pypy "$PYPY"
    rm "$PYPY"
done
