#!/bin/bash

docker login -u $USER -p $PASS

docker push hirendrakoche/java_maven_devops:$BUILD_NUM