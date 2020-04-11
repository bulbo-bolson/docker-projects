FROM centos/python-35-centos7

USER root
RUN yum -y install openssh-server
RUN useradd remote_user && \
    echo "1234" | passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

# fix ssh server daemon error in container
RUN /usr/sbin/sshd-keygen > /dev/null 2>&1 

RUN yum -y install mysql

ENV LD_LIBRARY_PATH /opt/rh/rh-python35/root/usr/lib64:/opt/rh/rh-nodejs10/root/usr/lib64:/opt/rh/httpd24/root/usr/lib64
RUN yum -y install epel-release && \
    yum -y install python-pip && \
    pip install --upgrade pip && \
    pip install awscli

CMD /usr/sbin/sshd -D
