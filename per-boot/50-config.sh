#!/bin/bash
FQDN=`ec2metadata --public-hostname`
ZONENAME="tempZone"

sudo sed -i 's/serverURL.*/serverURL = \"http:\/\/'"$FQDN"'\" \}/g;
    s/idrop.config.preset.zone=.*/idrop.config.preset.zone=\"'"$ZONENAME"'\"/g' /etc/idrop-web/idrop-web-config2.groovy
sudo service tomcat6 restart
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
