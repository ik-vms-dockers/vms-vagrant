## Setup td-agent on Amazon linux
https://docs.fluentd.org/v0.12/articles/install-by-rpm

log location
cd /var/log/td-agent
tail -f td-agent.log
Script
curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh

Check version
rpm -q td-agent

Update version
gem update dt

curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent2.sh | sh

$ /etc/init.d/td-agent start
$ /etc/init.d/td-agent stop
$ /etc/init.d/td-agent restart
$ /etc/init.d/td-agent status


https://raw.githubusercontent.com/treasure-data/elastic-beanstalk-td-agent/master/.ebextensions/0-td-agent-gen-config.config



Config Directory	/etc/td-agent/
Config File	/etc/td-agent/td-agent.conf	This config will be picked-up by the startup script
Startup Script	/etc/init.d/td-agent
Log Directory	/var/log/td-agent/
Plugin Directory	/etc/td-agent/plugin/	Your custom plugins go here.


https://github.com/treasure-data/elastic-beanstalk-td-agent

https://raw.githubusercontent.com/treasure-data/elastic-beanstalk-td-agent/master/.ebextensions/1-td-agent-install.config


path /my/dest/${tag}/mydata.%Y-%m-%d.log


/etc/td-agent/plugin

install plugin elastic search.
sudo /opt/td-agent/embedded/bin/fluent-gem install fluent-plugin-elasticsearch
sudo /opt/td-agent/embedded/bin/fluent-gem install fluent-plugin-forest

or install
install libcurl-devel & gcc

nice plugins
https://hub.docker.com/r/williamyeh/fluentd/~/dockerfile/

digital ocean Setup
https://www.digitalocean.com/community/tutorials/how-to-centralize-your-docker-logs-with-fluentd-and-elasticsearch-on-ubuntu-14-04


td-agent -buffer
buffer_type file
buffer_path /var/log/td-agent/buffer/${tag_parts[-1]}.*.${tag_parts[-2]}
flush_interval 1s
flush_at_shutdown true
