#!/usr/bin/env bash

echo 'Setup AWS CLI tools'
sudo apt-get update
sudo apt-get install -y python-pip
pip install --upgrade pip
sudo pip install --upgrade awscli


mkdir ~/.aws
cp /vagrant/template/aws/config ~/.aws/config
cp /vagrant/template/aws/credentials ~/.aws/credentials

# setup command complitions
complete -C '/usr/local/bin/aws_completer' aws
# setup bash profile
cp /vagrant/template/.bash_profile ~/.bash_profile
echo 'Installed AWS CLI'
# aws ec2 describe-regions
