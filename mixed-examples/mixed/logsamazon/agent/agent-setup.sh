#!/bin/bash
echo "======================"
echo "Fluentbit Installation"
echo "======================"

V='fluent-bit-0.12.0'
VERSION="${V}.tar.gz"
TARBALL="http://fluentbit.io/releases/0.12/${VERSION}"
CONFIG_LOCATION='/fluent-bit/etc/fluent-bit.conf'
FLUENT_BIT='/fluent-bit/bin/fluent-bit'

echo "=========================================="
echo "Download, build and install Fluent Bit    "
echo " from sources."
echo "There are no binaries for Amazon Linux AMI"
echo "The build can be compresed and uploaded   "
echo " to private S3 bucket to speed up instance"
echo " Takes around 1 minute                    "
echo "=========================================="

sudo -k
sudo sh <<SCRIPT
yum install -y gcc-c++ cmake make
echo 'Create directories for fluent bit binaries'
mkdir -p /fluent-bit/bin /fluent-bit/etc /fluent-bit/log
echo "Download TARBALL"
curl -LO "${TARBALL}"
echo "Untar compressed binaries"
tar xvf ${VERSION} && rm "${VERSION}"
cd ${V}/build
cmake -DFLB_TESTS=No -DFLB_WITHOUT_EXAMPLES=On ../
make
install bin/fluent-bit /fluent-bit/bin/
rm -rf ../../${V}
#yum remove -y cmake make gcc-c++

echo "==================================="
echo "Configure and start Service        "
echo "Please setup Aggregator IP and port"
echo "==================================="

cat >${CONFIG_LOCATION} <<'EOF';
[SERVICE]
   Flush     2
   Daemon    yes
   Log_Level info

# REVIEW test setup
[INPUT]
   Name dummy
   Tag  prefix.testenvironment.dev.${HOSTNAME}.dummytest

# REVIEW swap 'dev' with ${DEV} set environemnt property for beanstalk instance
# Add ENV variable for every single value, except prefix for pattern matching if needed
[INPUT]
   Name tail
   Path /var/log/application.log
   Tag  prefix.testenvironment.dev.${HOSTNAME}.application

[INPUT]
   Name tail
   Path /var/log/Dwaccess.log
   Tag  prefix.testenvironment.dev.${HOSTNAME}.Dwaccess

[INPUT]
   Name tail
   Path /var/log/Web-1.log
   Tag  prefix.testenvironment.dev.${HOSTNAME}.Web-1

[INPUT]
   Name tail
   Path /var/log/Web-1.error.log
   Tag  prefix.testenvironment.dev.${HOSTNAME}.Web-1-error

[INPUT]
   Name tail
   Path /var/log/nginx/access.log
   Tag  prefix.testenvironment.dev.${HOSTNAME}.nginxaccess

# REVIEW can we have DNS name for host or make sure it is an elastic IP address.
[OUTPUT]
   Name            forward
   Match           prefix.*
   Host            IP.IP.IP.IP
   Port            24224
   Time_as_Integer True
EOF

echo 'Start Fluent BIT'
${FLUENT_BIT} -c ${CONFIG_LOCATION}
SCRIPT

echo "====================="
echo "Agent Setup Complete "
echo "====================="
