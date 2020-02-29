#!/bin/bash
tag=pypywheels/manylinux2010-pypy_x86_64
build_id=$(git show -s --format=%cd-%h --date=short $TRAVIS_COMMIT)

docker login -u pypywheels -p $DOCKERPASS
docker tag ${tag}:latest ${tag}:${build_id}
docker push ${tag}:${build_id}
docker push ${tag}:latest
