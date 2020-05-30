#!/usr/bin/env bash

CONFIG_LOCATION=/etc/td-agent/td-agent.conf

sudo cp fluent-bit.conf /fluent-bit/etc/
sudo /fluent-bit/bin/fluent-bit -c /fluent-bit/etc/fluent-bit.conf
