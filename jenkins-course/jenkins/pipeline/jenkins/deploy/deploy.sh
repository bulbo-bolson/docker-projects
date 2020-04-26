#!/bin/bash

echo "***********************"
echo "Deploying services"
echo "***********************"

IMAGE=app
DOCKER_HUB_TOKEN=$(cat /home/curro/gdrive/src/fun/docker-projects/jenkins-course/jenkins/secrets/token_docker_hub.txt)
DOCKER_HUB_USER=bulbo

echo "*** Logging in ***"
docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_TOKEN}

echo "*** Starting services ***"
docker-compose up -d
