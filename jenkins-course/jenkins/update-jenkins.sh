#!/bin/bash

INSTALL_DIR=/usr/share/jenkins
cd /tmp
wget https://updates.jenkins.io/latest/jenkins.war
cp -p ${INSTALL_DIR}/jenkins.war ${INSTALL_DIR}/jenkins.war.previous.$(date '+%Y%m%d') 
cp -p /tmp/jenkins.war ${INSTALL_DIR}/jenkins.war
