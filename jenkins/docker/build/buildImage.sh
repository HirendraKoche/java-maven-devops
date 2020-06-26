#!/bin/bash

docker image build -t hirendrakoche/java_maven_devops:$BUILD_NUMBER -f jenkins/docker/build/Dockerfile $PWD