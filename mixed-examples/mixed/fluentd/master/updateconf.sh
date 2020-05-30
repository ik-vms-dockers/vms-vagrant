#!/usr/bin/env bash

CONFIG_LOCATION=/etc/td-agent/td-agent.conf

sudo cp ./td-agent.conf ${CONFIG_LOCATION}

sudo service td-agent restart
