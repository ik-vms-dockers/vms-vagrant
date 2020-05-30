#!/usr/bin/env bash

echo 'Copy ssh keys... Please wait'
FILE=~/.ssh/MyEc2Key.pem
if [ ! -f $FILE ]; then
   echo "File $FILE does not exist."
   cp /vagrant/credentials/MyEc2Key.pem ~/.ssh/MyEc2Key.pem
   chmod 400 ~/.ssh/MyEc2Key.pem
   eval "$(ssh-agent)"
   ssh-agent bash
   cd ~/.ssh
   ssh-add MyEc2Key.pem
   ssh-add -l
fi

echo 'SSH keys kopied'
