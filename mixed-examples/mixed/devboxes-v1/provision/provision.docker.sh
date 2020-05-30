#!/usr/bin/env bash
# https://docs.docker.com/compose/install/
echo 'Install Docker'
sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# Wheezy:
sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl \
  python-software-properties

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get -y install docker-ce
# for production system install
# apt-cache madison docker-ce
sudo usermod -aG docker $(whoami)
sudo systemctl enable docker
echo 'Install Docker-Compose'
sudo systemctl stop docker
sudo curl --silent -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > ~/docker-compose
chmod +x ~/docker-compose
sudo mv ~/docker-compose /usr/local/bin/docker-compose
docker-compose -v
sudo systemctl start docker
echo 'Docker Installation completed'
