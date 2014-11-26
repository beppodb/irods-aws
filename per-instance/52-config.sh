#!/bin/bash
FQDN=`ec2metadata --public-hostname`
ZONENAME="tempZone"

export CATALINA_BASE=/var/lib/tomcat6
export CATALINA_HOME=/usr/share/tomcat6
export JRE_HOME=/usr/lib/jvm/java-6-openjdk-amd64

/home/ubuntu/genresp.sh
/home/ubuntu/setupdb.sh
sudo su -c "/var/lib/irods/packaging/setup_irods.sh </home/ubuntu/setup_responses"
sed -i 's/serverURL.*/serverURL = \"http:\/\/'"$FQDN"':'"80"'\/idrop-web2\" \}/g;
    s/idrop.config.preset.zone=.*/idrop.config.preset.zone=\"'"$ZONENAME"'\"/g' /etc/idrop-web/idrop-web-config2.groovy
cp /home/ubuntu/idrop-web2.war /var/lib/tomcat6/webapps
