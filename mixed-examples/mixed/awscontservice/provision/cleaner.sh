#!/usr/bin/env bash

# clean all the packages and etc
sudo apt-get update
sudo apt-get upgrade
# clean
sudo apt-get autoclean
sudo apt-get autoremove

history -c
