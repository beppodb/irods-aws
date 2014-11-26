#!/bin/bash
sudo cp ./per-boot/* /var/lib/cloud/scripts/per-boot
sudo cp ./per-instance/* /var/lib/cloud/scripts/per-instance
cd ./per-once
./build.sh
