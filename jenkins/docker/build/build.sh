#!/bin/bash

# Start docker maven container

docker container run \
       --rm \
       --name mvn-build \
       --volumes-from $(docker container ls -q --filter name=_jenkins.1) \
       --workdir $JENKINS_HOME/workspace/Pipeline_Petclinic \
       maven:3.6.3-jdk-8 "$@"
       