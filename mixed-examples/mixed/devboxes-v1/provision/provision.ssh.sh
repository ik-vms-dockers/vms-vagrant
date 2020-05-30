#!/usr/bin/env bash

echo 'setup ssh keys'

cp /vagrant/keys/pis-shared.pem* ~/.ssh/.
cp /vagrant/template/ssh/config ~/.ssh/.

cat ~/.ssh/pis-shared.pem.pub >> ~/.ssh/authorized_keys
cp /vagrant/template/ssh/config ~/.ssh/.

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chmod 600 ~/.ssh/config
chmod 400 ~/.ssh/pis-shared.pem*

eval "$(ssh-agent)"
ssh-add ~/.ssh/pis-shared.pem
# the pub key can be removed is needed

echo 'ssh keys provisioned'
