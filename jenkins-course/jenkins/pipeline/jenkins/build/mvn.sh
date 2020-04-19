#!/bin/bash

echo "***********************"
echo "Building jar"
echo "***********************"

# docker run --rm -v /root/.m2:/root/.m2 -v "$PWD/simple-java-maven-app:/app" -w /app maven:3-alpine mvn -B -DskipTests clean package
docker run --rm -v /root/.m2:/root/.m2 -v "$PWD/simple-java-maven-app:/app" -w /app maven:3-alpine mvn "${@}"

