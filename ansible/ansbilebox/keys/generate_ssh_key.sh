#!/bin/bash

USERNAME=$1
STACKNAME=$2

if [ -z "$USERNAME" ]; then
    echo error: please specify a username
    exit 1
fi
if [ -z "$STACKNAME" ]; then
    echo error: please specify an environment
    exit 1
fi

ssh-keygen -t rsa -b 4096 -f ~/.ssh/${USERNAME}-${STACKNAME} -C "${USERNAME}-${STACKNAME} $(date +%Y-%m-%d)"
aws s3 --region eu-west-1 cp ~/.ssh/${USERNAME}-${STACKNAME}.pub s3://${STACKNAME}-bastion-ssh-keys/public-keys/${USERNAME}.pub
