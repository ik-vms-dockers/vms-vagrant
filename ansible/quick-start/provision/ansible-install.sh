#!/usr/bin/env bash

echo 'set ansible'
sudo apt-get update
# give us an ability to work with PPA easily
sudo apt-get install software-properties-common -y

# add ansible PPA
sudo apt-add-repository ppa:ansible/ansible -y
# refresh packages, to make sure ansible package is available
sudo apt-get update
sudo apt-get install ansible -y

echo 'copy ansible configuration files hosts and *.cfg'
sudo cp /vagrant/template/ansible/hosts  /etc/ansible/hosts
sudo cp /vagrant/template/ansible/ansible.cfg /etc/ansible/ansible.cfg

echo 'Ansible installed and hosts provisioned'
