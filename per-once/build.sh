#!/bin/bash

# build.sh
# Installs iRODS and iDrop Web

IRODS_VERSION=$1
DB_PLUGIN_VERSION=$2

sudo apt-get update
sudo apt-get -y install postgresql openjdk-7-jdk tomcat7
wget ftp://ftp.renci.org/pub/irods/releases/${IRODS_VERSION}/irods-icat-${IRODS_VERSION}-64bit.deb
wget ftp://ftp.renci.org/pub/irods/releases/${IRODS_VERSION}/irods-database-plugin-postgres-${DB_PLUGIN_VERSION}.deb
sudo dpkg -i irods-database-plugin-postgres-${DB_PLUGIN_VERSION}.deb irods-icat-${IRODS_VERSION}-64bit.deb
sudo apt-get -f -y install
wget http://people.renci.org/~danb/FOR_DEMOS/iDrop-Web-2/idrop-web2.war
sudo update-java-alternatives -s java-1.7.0-openjdk-amd64
sudo mkdir /etc/idrop-web
sudo mkdir /etc/tomcat7
sudo cp ./server.xml /etc/tomcat7
sudo cp ./idrop-web-config2.groovy /etc/idrop-web
sudo cp ./idrop-web2.war /var/lib/tomcat7/webapps/ROOT.war
sudo rm -rf /var/lib/tomcat7/webapps/ROOT
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
sudo cp ./motd.tail /etc
sudo cp ./*.cron /etc/cron.d
