#!/bin/bash
docker login -u pypywheels -p $DOCKERPASS
tag=pypywheels/manylinux2010-pypy_x86_64
docker push ${tag}:latest
