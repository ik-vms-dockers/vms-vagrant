#!/bin/bash

sudo cp /vagrant/template/dnsresolution/master.hosts /etc/hosts
echo $(hostname -I | cut -d\  -f1) $(hostname) | sudo tee -a /etc/hosts
