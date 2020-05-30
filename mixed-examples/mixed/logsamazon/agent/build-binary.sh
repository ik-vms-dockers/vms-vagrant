#!/bin/bash

echo "=================================================="
echo "Download, and build Fluent Bit binary from sources"
echo "There are no binaries for Amazon Linux AMI        "
echo "The build can be compresed and uploaded to private"
echo " S3 bucket to speed up instance setup uptime      "
echo "=================================================="
TARBALL="http://fluentbit.io/releases/0.12/${VERSION}"
VERSION='fluent-bit-0.12.0.tar.gz'

sudo yum install -y gcc-c++ cmake make


yum remove -y cmake make gcc-c++
