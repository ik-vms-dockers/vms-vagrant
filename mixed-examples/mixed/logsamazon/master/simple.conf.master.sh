#!/usr/bin/env bash

# review make it as script
CONFIG_LOCATION=/etc/td-agent/td-agent.conf
sudo cp ./td-agent.conf ${CONFIG_LOCATION}
sudo service td-agent restart
