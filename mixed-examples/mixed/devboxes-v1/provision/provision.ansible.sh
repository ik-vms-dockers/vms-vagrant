#!/usr/bin/env bash

echo 'Setup Ansible'
sudo apt-get update
# give us an ability to work with PPA easily
sudo apt-get install software-properties-common -y

# add ansible PPA
sudo apt-add-repository ppa:ansible/ansible -y
# refresh packages, to make sure ansible package is available
sudo apt-get update
sudo apt-get install ansible -y

echo 'Ansible installed and hosts provisioned'
