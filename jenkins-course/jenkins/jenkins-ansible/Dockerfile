FROM custom_jenkins

USER root
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python get-pip.py
RUN pip install -U ansible

# Update Jenkins war to latest version
RUN wget https://updates.jenkins.io/latest/jenkins.war -O /usr/share/jenkins/jenkins.war

ENTRYPOINT usermod -u $(stat -c "%u" /var/jenkins_home) jenkins && \
        gosu jenkins /sbin/tini -- /usr/local/bin/jenkins.sh

