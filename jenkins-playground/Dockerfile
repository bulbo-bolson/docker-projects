FROM alpine
ENV JENKINS_PORT=8080
ENV TMP_ROOT_INSTALLATION=/tmp

ADD http://mirrors.jenkins.io/war-stable/latest/jenkins.war /${TMP_ROOT_INSTALLATION}/
RUN apk update && apk upgrade && \
    apk add openjdk8 && \
    apk add git && \
    apk add ttf-dejavu
# ENTRYPOINT ["java", "-jar", "/${TMP_ROOT_INSTALLATION}/jenkins.war --httpPort=${JENKINS_PORT}"]
ENTRYPOINT ["sleep", "300000"]
EXPOSE ${JENKINS_PORT}/tcp
