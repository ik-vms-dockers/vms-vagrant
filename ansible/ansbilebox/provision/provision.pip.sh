#!/usr/bin/env bash

echo 'Provision pip'
sudo apt-get install -y python-pip
sudo -H pip install --upgrade pip
# aws cli support
sudo -H pip install boto3
# progress bars
sudo -H pip install tqdm
# fake factory for testing
sudo -H pip install fake-factory

echo 'Pip provisioned'
