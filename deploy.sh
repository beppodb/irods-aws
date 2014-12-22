#!/bin/bash

# deploy.sh
# Deploys iRODS and iDrop Web to an Amazon Machine Image. Includes per-instance script
# to generate random password for iRODS administrator account (i.e., rods).

IRODS_VERSION=$1
DB_PLUGIN_VERSION=$2

sudo cp ./per-instance/* /var/lib/cloud/scripts/per-instance
cd ./per-once
./build.sh $IRODS_VERSION $DB_PLUGIN_VERSION
