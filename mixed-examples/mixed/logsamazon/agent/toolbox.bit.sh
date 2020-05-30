#!/bin/bash
echo "======================"
echo "Fluentbit Installation"
echo "======================"


# clear any previous sudo permissions
sudo -k

# run with sudo permission
sudo sh <<SCRIPT

# add treasure data repository to yum
cat >/etc/yum.repos.d/td-agent-bit.repo <<"EOF";
[td-agent-bit]
name = TD Agent Bit
baseurl = http://packages.fluentbit.io/centos/7
gpgcheck=1
gpgkey=http://packages.fluentbit.io/fluentbit.key
enabled=1
EOF

# update repolist
yum repolist
# update package
yum check-update
# upgrade packages
yum upgdate -y
# yum upgrade -y
# install  bit
yes | yum install -y td-agent-bit

SCRIPT
