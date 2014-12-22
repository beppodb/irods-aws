irods-aws
=========

Installs a minimal iRODS installation with iDrop Web 2 on an Amazon Machine
Image.

This is meant to be installed on an Ubuntu 12.04 Amazon Machine Image.
To find an appropriate target, see http://cloud-images.ubuntu.com/locator/ec2/

Use the following process to bootstrap the AWS image. The process:
* installs git,
* clones this repository,
* downloads and installs iRODS and iDrop Web 2, and their dependencies,
* installs a cron job to update the iDrop Web 2 config on hostname changes.

```bash
sudo apt-get -y install git
cd /opt
git clone https://github.com/beppodb/irods-aws
cd /opt/irods-aws
./deploy.sh
sudo shred -u /etc/ssh/*_key /etc/ssh/*_key.pub
sudo shred -u /home/ubuntu/.ssh/authorized_keys
sudo shred -u /home/ubuntu/.*history
history -c
```

The resultant iRODS installation has a single user with a password that is
generated randomly on creation of the instance. Instructions for setting a
new password are in ./per-once/motd.tail, which is displayed at instance login.
