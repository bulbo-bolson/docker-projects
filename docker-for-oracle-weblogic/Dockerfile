# LICENSE UPL 1.0
#
# Copyright (c) 2018 Oracle and/or its affiliates. All rights reserved.
#
# ORACLE DOCKERFILES PROJECT
# --------------------------
# This Dockerfile extends the Oracle WebLogic image by installing the Supplemental package of WebLogic which 
# includes extra samples of Java EE, Coherence applications, and Multitenant domains. 
#
# REQUIRED FILES TO BUILD THIS IMAGE
# ----------------------------------
# (1) fmw_12.2.1.2.0_wls_supplemental_quick_Disk1_1of1.zip
#     Download the Developer Quick installer from http://www.oracle.com/technetwork/middleware/weblogic/downloads/wls-for-dev-1703574.html 
#
# (2) sqlcl-17.4.0.354.2224-no-jre.zip
#     Download command-line tool for connecting to the Oracle Database from http://www.oracle.com/technetwork/developer-tools/sqlcl/downloads/index.html
#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put all downloaded files in the same directory as this Dockerfile
# Run: 
#      $ sudo docker-compose up -d 
#

# Pull base image
# ---------------
#FROM oracle/weblogic:12.2.1.2-developer
# FROM store/oracle/weblogic:12.2.1.2
FROM store/oracle/weblogic:12.2.1.3

# Maintainer
# ----------
#MAINTAINER Monica Riccelli <monica.riccelli@oracle.com>

# Environment variables required for this build (do NOT change)
# -------------------------------------------------------------
ENV FMW_PKG="fmw_12.2.1.3.0_wls_supplemental_quick_Disk1_1of1.zip" \
    FMW_JAR="fmw_12.2.1.3.0_wls_supplemental_quick.jar" \
    MW_HOME="$ORACLE_HOME" \ 
    PATH="$ORACLE_HOME/wlserver/server/bin:$ORACLE_HOME/wlserver/../oracle_common/modules/org.apache.ant_1.9.2/bin:$JAVA_HOME/jre/bin:$JAVA_HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$ORACLE_HOME/oracle_common/common/bin:$ORACLE_HOME/wlserver/common/bin:$ORACLE_HOME/user_projects/domains/medrec/bin:$ORACLE_HOME/wlserver/samples/server/medrec/:$ORACLE_HOME/wlserver/samples/server/:$ORACLE_HOME/wlserver/../oracle_common/modules/org.apache.maven_3.2.5/bin"
ENV WEBLOGIC_OS_USER="oracle"
ENV WEBLOGIC_OS_GROUP="oracle"

# Copy supplemental package and scripts
# --------------------------------
COPY $FMW_PKG /u01/
USER root
COPY container-scripts/*  /u01/oracle/
COPY demo_oracle.ddl  /u01/oracle/
# COPY sqlcl-17.4.0.354.2224-no-jre.zip  /u01/oracle/
COPY sqlcl-19.4.0.354.0937.zip  /u01/oracle/
RUN chmod +xr /u01/oracle/startSample.sh 

# Installation of Supplemental Quick Installer 
# --------------------------------------------
USER oracle
RUN cd /u01 && $JAVA_HOME/bin/jar xf /u01/$FMW_PKG && cd - && \
    $JAVA_HOME/bin/java -jar /u01/$FMW_JAR  ORACLE_HOME=$ORACLE_HOME && \
    echo $USER && \
    mv /u01/oracle/startSample.sh /u01/oracle/wlserver/samples/server/  && \
    rm /u01/$FMW_PKG /u01/$FMW_JAR

USER root
RUN yum -y install unzip \
    && cd /u01/oracle/ \
    && unzip sqlcl-19.4.0.354.0937.zip \
    && rm /u01/oracle/sqlcl-19.4.0.354.0937.zip

# basic sysadmin utilites
RUN yum -y install \
    net-tools \
    procps-ng

# install necessary tools for molecule execution
RUN yum -y install python2-pip \
    && pip install --upgrade setuptools \
    && yum install -y gcc \
    && yum install -y python-devel \
    && pip install ansible \
    && pip install docker \
    && pip install docker-py

# directorios como en batera
RUN mkdir /oracle \
    && chown ${WEBLOGIC_OS_USER}:${WEBLOGIC_OS_GROUP} /oracle \
    && mkdir /aplic \
    && mkdir /datos \
    && mkdir /config \
    && mkdir /config/medrec \
    && mkdir /aplic/alm-dists \
    && mkdir /logs \
    && chown ${WEBLOGIC_OS_USER}:${WEBLOGIC_OS_GROUP} /aplic /datos /config /config/medrec /aplic/alm-dists /logs

# por comodidad
RUN echo 'set -o vi' >> /root/.bashrc \
    && echo "alias ll='ls -l'" >> /root/.bashrc

# copiamos el distribuible
COPY resources/*.zip /aplic/alm-dists/

RUN chmod +xr /u01/oracle/wlserver/samples/server/*.sh

WORKDIR $ORACLE_HOME/wlserver/samples/server

EXPOSE 7011

CMD ["startSample.sh"]
