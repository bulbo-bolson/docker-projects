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

# instala Ansible
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python get-pip.py
RUN pip install -U ansible

# Instala Docker

RUN apt-get update && \
apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
apt-get update && \
apt-get -y install docker-ce

# COmpose

RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

# Update Jenkins war to latest version
RUN wget https://updates.jenkins.io/latest/jenkins.war -O /usr/share/jenkins/jenkins.war

ENTRYPOINT usermod -u $(stat -c "%u" /var/jenkins_home) jenkins && \
        gosu jenkins /sbin/tini -- /usr/local/bin/jenkins.sh

