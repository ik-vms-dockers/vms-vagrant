#!/bin/bash
# sudo dpkg-preconfigure -f noninteractive -p critical
# sudo dpkg --configure -a

# export DEBIAN_FRONTEND=noninteractive
# export LANGUAGE=en_US.UTF-8
# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# locale-gen en_US.UTF-8
# sudo dpkg-reconfigure locales -f noninteractive -p critical
# sudo dpkg --configure -a

echo 'install packages'
sudo apt-get update
# sudo apt-get upgrade
# sudo apt-get install -f

sudo apt-get install git python openssl nano -y

echo 'end installing packages'
