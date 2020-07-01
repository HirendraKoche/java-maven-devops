#!/bin/bash

sed -i "5s|\:.*$|: hirendrakoche/java_maven_devops:$BUILD_NUMBER|g" docker-compose.yml