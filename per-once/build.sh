#!/bin/bash
sudo apt-get update
sudo apt-get -y install postgresql openjdk-6-jdk tomcat6
wget ftp://ftp.renci.org/pub/irods/releases/4.0.3/irods-icat-4.0.3-64bit.deb
wget ftp://ftp.renci.org/pub/irods/releases/4.0.3/irods-database-plugin-postgres-1.3.deb
sudo dpkg -i irods-database-plugin-postgres-1.3.deb irods-icat-4.0.3-64bit.deb
sudo apt-get -f -y install
wget http://people.renci.org/~danb/FOR_DEMOS/iDrop-Web-2/idrop-web2.war
sudo mkdir /etc/idrop-web
sudo mkdir /etc/tomcat6
sudo cp ./server.xml /etc/tomcat6
sudo cp ./idrop-web-config2.groovy /etc/idrop-web
sudo cp ./idrop-web2.war /var/lib/tomcat6/webapps
