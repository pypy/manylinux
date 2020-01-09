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

    if [ -f $outdir/bin/pypy ]; then
        # add a generic "python" symlink
        ln -s pypy $outdir/bin/python
        ln -s pypy $outdir/bin/python2
    fi

    # Since we mix pypy and Squeaky's portable binaries some links may already exist...
    if [ -f $outdir/bin/pypy3 ]; then
        # pypy -> pypy3
        if [ ! -f $outdir/bin/pypy ]; then

            ln -s pypy3 $outdir/bin/pypy
        fi

        # python -> pypy3
        if [ ! -f $outdir/bin/python ]; then

            ln -s pypy3 $outdir/bin/python
        fi
        # python3 -> pypy3
        if [ ! -f $outdir/bin/python3 ]; then

            # make python -> pypy3 link

            ln -s pypy3 $outdir/bin/python3
        fi
    fi

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

for TARBALL in /pypy*.tar.bz2
do
    install_one_pypy "$TARBALL"
    rm "$TARBALL"
done


# the following is copied&adapted from
# pypa/manylinux/docker/build_scripts/build.sh

for PYTHON in /opt/pypy/*/bin/python; do
    # Smoke test to make sure that our Pythons work, and do indeed detect as
    # being manylinux compatible:
    $PYTHON /build_scripts/manylinux-check.py
    # Make sure that SSL cert checking works
    $PYTHON /build_scripts/ssl-check.py
done

# We do not need the Python test suites, or indeed the precompiled .pyc and
# .pyo files. Partially cribbed from:
#    https://github.com/docker-library/python/blob/master/3.4/slim/Dockerfile
find /opt/pypy -depth \
     \( -type d -a -name test -o -name tests \) \
  -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) | xargs rm -rf
