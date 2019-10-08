# Jenkins playground

Image to play with jenkins technology

- Build image: `docker build -t jenkins-playground .`
- Run image: `docker run -it -d -p 8080:8080 --privileged jenkins-playground`
- See image name: `docker ps`
- Log into image: `docker exec -it <DOCKER_IMAGE_NAME> /bin/sh`
- Run jenkins: `java -jar /tmp/jenkins.war --httpPort=8080`
- Run jenkins in browser: `http://localhost:8080`
