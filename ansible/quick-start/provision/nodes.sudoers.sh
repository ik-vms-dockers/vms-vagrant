#!/bin/bash
# TODO create separate file for bastion
# check if this really needed to setup user on every each box
echo "Provision $(hostname)"
sudo useradd -p $(openssl passwd -1 ansible) -m ansible

sudo su
echo "ansible      ALL=(ALL)        NOPASSWD: ALL"  >> /etc/sudoers
su ansible
echo "who am i $USER"

#  https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-14-04
# harden ssh config
sudo cp /vagrant/template/keys/sshd_config /etc/ssh/sshd_config
sudo service sshd restart

sudo mkdir -p /home/ansible/.ssh
sudo cp /vagrant/template/keys/ansible_rsa.pub /home/ansible/.ssh/.
sudo chmod 400 /home/ansible/.ssh/ansible_rsa*

cat /home/ansible/.ssh/ansible_rsa.pub >> /home/ansible/.ssh/authorized_keys

sudo chown -R ansible:ansible /home/ansible/.ssh
chmod 700 /home/ansible/.ssh
chmod 600 /home/ansible/.ssh/authorized_keys
#  remove public key

echo "$(hostname) provisioned"
