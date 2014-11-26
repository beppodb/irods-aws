irods-aws
=========

Installs a minimal iRODS installation with iDrop Web 2 on an Amazon Machine
Image.

This is meant to be installed on an Ubuntu 12.04 Amazon Machine Image.
To find an appropriate target, see http://cloud-images.ubuntu.com/locator/ec2/

Use the following process to bootstrap the AWS image.

```bash
sudo apt-get -y install git
cd /home/ubuntu
git clone https://github.com/beppodb/irods-aws
irods-aws/deploy.sh
sudo shred -u /etc/ssh/*_key /etc/ssh/*_key.pub
sudo shred -u /home/ubuntu/.ssh/authorized_keys
sudo shred -u /home/ubuntu/.*history
history -c
```
