#!/usr/bin/env bash

echo 'Installing Apache and setting apache up... please wait'
sudo apt-get update > /dev/null 2>&1
sudo apt-get install -y apache2 > /dev/null 2>&1
# symbolic link setup
sudo rm -fr /var/www
sudo ln -fs /vagrant /var/www
echo 'Apache 2 Installed'
