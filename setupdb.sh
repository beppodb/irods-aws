#!/bin/bash
RESPFILE="/home/ubuntu/setup_responses"
DBUSER=`tail -n 3 $RESPFILE | head -n 1`
DBPASS=`tail -n 2 $RESPFILE | head -n 1`

sudo -u postgres createdb -O postgres 'ICAT'
sudo -u postgres psql -U postgres -d postgres -c "CREATE USER $DBUSER WITH PASSWORD '$DBPASS'"
sudo -u postgres psql -U postgres -d postgres -c "GRANT ALL PRIVILEGES ON DATABASE \"ICAT\" TO $DBUSER"
