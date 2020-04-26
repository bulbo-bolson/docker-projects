#!/bin/bash

echo "***********************"
echo "Building jar"
echo "***********************"

# docker run --rm -v /root/.m2:/root/.m2 -v "$PWD/simple-java-maven-app:/app" -w /app maven:3-alpine mvn -B -DskipTests clean package
# al usar el socket de la maquina remota, docker se confunde con la ruta y PWD no corresponde a lo que deberia, le ponemos la ruta completa de la maquina local
docker run --rm -v /root/.m2:/root/.m2 -v "/home/curro/gdrive/src/fun/docker-projects/jenkins-course/jenkins/pipeline/simple-java-maven-app:/app" -w /app maven:3-alpine mvn "${@}"

