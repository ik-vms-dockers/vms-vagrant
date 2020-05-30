#!/usr/bin/env bash

BIT=/opt/td-agent-bit/bin/td-agent-bit
CONFIG="master.conf"

${BIT} -c ${CONFIG}
