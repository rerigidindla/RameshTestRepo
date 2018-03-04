#!/bin/sh
JENKINS_VERSION="2.0-rc-1"
###
# Automatic install docker with script
# @see <a href="https://docs.docker.com/engine/installation/linux/centos/">Installation on CentOS</a>
##
curl -fsSL https://get.docker.com/ | sh

# start docker.service
systemctl start docker

# pull jenkins image
docker pull jenkinsci/jenkins:$JENKINS_VERSION

# local jenkins home
mkdir -p /var/jenkins
chown 1000 /var/jenkins

# start jenkins as deamon
 docker run -d -p 8080:8080 -p 50000:50000 -v /var/jenkins:/var/jenkins_home jenkinsci/jenkins:$JENKINS_VERSION
