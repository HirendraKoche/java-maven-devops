#!/bin/bash

# Start docker maven container

WORKDIR=$PWD

docker container run \
       --rm \
       --name mvn-build \
       --volume $WORKDIR:/app \
       --volume $JENKINS_HOME/.m2:/root/.m2 \
       --workdir /app \
       maven:3.6.3-jdk-8 "$@"