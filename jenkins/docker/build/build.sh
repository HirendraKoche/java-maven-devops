#!/bin/bash

# Start docker maven container

docker container run \
       --rm \
       --name mvn-build \
       --volume $PWD:/app \
       --volume $JENKINS_HOME/.m2:/root/.m2
       --workdir /app \
       maven:3.6.3-jdk-8 "$@"