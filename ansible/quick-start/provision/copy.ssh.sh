#!/bin/bash
# should be an ansible
# -o StrictHostKeyChecking=no
sudo ssh-copy-id -i ~/.ssh/ansible_rsa.pub ansible@web-server
sudo ssh-copy-id -i ~/.ssh/ansible_rsa.pub ansible@db-server
