FROM jenkinsci/jenkins

# Modify the UID of the jenkins user to automatically match the mounted volume.
# Use it just like the original: https://hub.docker.com/_/jenkins/

USER root

# Grab gosu for easy step-down from root.
ADD https://github.com/tianon/gosu/releases/download/1.5/gosu-amd64 /usr/local/bin/gosu

# Update Jenkins war to latest version
RUN wget https://updates.jenkins.io/latest/jenkins.war -O /usr/share/jenkins/jenkins.war

# Change the group of the jenkins user to root, because that group has no 
# special rights on most host systems.
RUN chmod 755 /usr/local/bin/gosu && usermod -g root jenkins

ENTRYPOINT usermod -u $(stat -c "%u" /var/jenkins_home) jenkins && \
        gosu jenkins /sbin/tini -- /usr/local/bin/jenkins.sh
