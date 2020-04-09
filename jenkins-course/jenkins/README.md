- [Fix problem with uid](https://github.com/bdruemen/jenkins-docker-uid-from-volume/blob/master/Dockerfile)
- build image: `docker build -t custom_jenkins .`
- start service: `docker-compose up -d`
- user / pass: admin / admin

### remote-host centos
generate key par: `cd centos7; ssh-keygen -m pem -f remote-key`
