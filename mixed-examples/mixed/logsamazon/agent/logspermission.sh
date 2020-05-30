#!/usr/bin/env bash

USER=`whoami`

declare -a logs=('/var/log/application.log' '/var/log/Dwaccess.log' '/var/log/Web-1.log' '/var/log/Web-1.error.log' '/var/log/nginx/access.log')

for i in "${logs[@]}"
do
   echo "$i"
done

sudo sh <<SCRIPT
mkdir -p '/var/log/nginx'
for i in "${logs[@]}"
do
   touch $i
   chown -R $USER:$USER $i
done

SCRIPT
