#!/bin/bash

# Stop at any error, show all commands
set -ex

TAG=pypywheels/manylinux2010-pypy_x86_64
docker/build_scripts_pypy/prefetch_pypy.sh
docker build --rm -t $TAG:latest -f docker/Dockerfile-x86_64 docker/
