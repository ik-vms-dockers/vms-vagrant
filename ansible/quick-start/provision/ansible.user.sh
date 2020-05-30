#!/bin/bash
echo "Start provision user"
#  create user password
#  openssl passwd -crypt ivanka > /vagrant/pass
# sudo useradd -p $(openssl passwd -1 $PASS) $USERNAME
sudo useradd -p $(openssl passwd -1 ansible) -m ansible
# cat /etc/passwd | grep ansible
#  swith user sudo -u $USER

# sudo visudo. TODO just do the echo?
# sudo cp /vagrant/template/sudoers/sudoers /etc/sudoers
# echo "ansible ALL=(ALL) NOPASSWD: ALL " >> /etc/sudoers
sudo su
echo "who am i $USER"
echo "ansible      ALL=(ALL)        NOPASSWD: ALL"  >> /etc/sudoers
su ansible
echo "who am i $USER"
# implement the changes
. ~/.bashrc

# copy ssh keys
echo 'Create .ssh folder if not yet created'
sudo mkdir -p /home/ansible/.ssh
sudo cp /vagrant/template/keys/ansible_rsa* /home/ansible/.ssh/.
eval "$(ssh-agent)"
# ssh-agent bash
cd /home/ansible/.ssh
sudo chown -R ansible:ansible /home/ansible/.ssh
sudo chmod a+rw ansible_rsa*
ssh-add ansible_rsa

cat /home/ansible/.ssh/ansible_rsa.pub >> /home/ansible/.ssh/authorized_keys
cp /vagrant/template/keys/config /home/ansible/.ssh/config

sudo chown -R ansible:ansible /home/ansible/.ssh
chmod 700 /home/ansible/.ssh
chmod 600 /home/ansible/.ssh/authorized_keys
chmod 600 /home/ansible/.ssh/config
sudo chmod 400 ansible_rsa*

#
sudo mkdir /etc/ansible/group_vars
sudo cp /vagrant/template/ansible/group_vars/webserver /etc/ansible/group_vars/webserver

# check users home and password
# echo $HOME
# grep username /etc/passwd
echo "End provision user"
