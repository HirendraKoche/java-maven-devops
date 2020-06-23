#!/bin/bash

# Start docker maven container

docker container run \
       --rm \
       --name mvn-build \
       --volume $(pwd):/usr/src/mymaven \
       --workdir /usr/src/mymaven \
       maven:3.6.3-jdk-8 \
       mvn clean package
       