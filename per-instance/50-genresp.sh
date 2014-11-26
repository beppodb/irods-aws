#!/bin/bash
RESPFILE="/home/ubuntu/setup_responses"

echo "irods" > $RESPFILE                 # service account user ID
echo "irods" >> $RESPFILE                # service account password
echo "tempZone" >> $RESPFILE             # initial zone name
echo "1247" >> $RESPFILE                 # service port #
echo "20000" >> $RESPFILE                # transport starting port #
echo "20199" >> $RESPFILE                # transport ending port #
echo "/var/lib/irods/Vault" >> $RESPFILE # vault path
(openssl rand -base64 16 | sed 's,/,S,g' | cut -c 1-16 \
 | tr -d '\n' ; echo "-SID") >> $RESPFILE # zone SID
openssl rand -base64 32 | sed 's,/,S,g' | cut -c 1-32 >> $RESPFILE # agent key
echo "rods" >> $RESPFILE                  # iRODS admin account
openssl rand -base64 16 | sed 's,/,S,g' | cut -c 1-16 >> $RESPFILE      # iRODS admin password
echo "yes" >> $RESPFILE                   # confirm iRODS settings
echo "localhost" >> $RESPFILE             # database hostname
echo "5432" >> $RESPFILE                  # database port
echo "ICAT" >> $RESPFILE                  # database DB name
echo "irods" >> $RESPFILE                 # database admin username
openssl rand -base64 16 | sed 's,/,S,g' | cut -c 1-16 >> $RESPFILE        # database admin password
echo "yes" >> $RESPFILE                   # confirm database settings