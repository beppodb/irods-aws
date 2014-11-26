#!/bin/bash
wget ftp://ftp.renci.org/pub/irods/releases/4.0.3/irods-icat-4.0.3-64bit.deb
wget ftp://ftp.renci.org/pub/irods/releases/4.0.3/irods-database-plugin-postgres-1.3.deb
sudo apt-get -y install postgresql openjdk-6-jdk tomcat6
sudo dpkg -i irods-database-plugin-postgres-1.3.deb irods-icat-4.0.3-64bit.deb
sudo apt-get -f install
wget http://people.renci.org/~danb/FOR_DEMOS/iDrop-Web-2/idrop-web2.war
mkdir /etc/idrop-web
mkdir /etc/tomcat6
cp /home/ubuntu/server.xml /etc/tomcat6
cp /home/ubuntu/idrop-web-config2.groovy /etc/idrop-web

