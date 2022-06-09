#!/bin/bash
sudo yum -y update

echo "Install Java JDK 8"
yum remove -y java
yum install -y java-1.8.0-openjdk

echo "Install Maven"
yum install -y maven 

echo "Install git"
yum install -y git

echo "Install Docker engine"
yum update -y
yum install docker -y
#sudo usermod -a -G docker jenkins
#sudo service docker start
sudo chkconfig docker on
sudo service docker start

echo "Install Tomcat"
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.41/bin/apache-tomcat-9.0.41.tar.gz
#cd /usr/local
tar -xvf /root/apache-tomcat-9.0.41.tar.gz
mv apache-tomcat-9.0.41 tomcat9
sudo useradd -r tomcat
sudo chown -R tomcat:tomcat /usr/local/tomcat9

#Reload tomcat service
sudo systemctl daemon-reload

#Restart/Start tomcat service
sudo systemctl start tomcat

#Check tomcat service status
systemctl status tomcat.service

echo "Install Ansible"
yum update -y
sudo amazon-linux-extras install ansible2 -y
ansible --version

