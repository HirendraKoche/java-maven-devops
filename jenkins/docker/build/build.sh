#!/bin/bash

# Start docker maven container

WORKDIR=$PWD

docker container run \
       --rm \
       --name mvn-build \
       --volume-from $(docker container ls -q --filter name=_jenkins.1) \
       --workdir $PWD \
       maven:3.6.3-jdk-8 "$@"