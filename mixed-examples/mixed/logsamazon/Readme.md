
# setup Aggregator
curl -L https://s3.eu-west-2.amazonaws.com/fluentd-ivanka/serversetup.sh | sh

Aggregator Log location
/var/log/td-agent/td-agent.log
Aggregator Config location
/etc/td-agent/td-agent.conf

Setup Aggregator
curl -L https://s3.eu-west-2.amazonaws.com/fluentd-ivanka/agent-setup.sh | sh

deploy python code
eb create newapp --cfg python-27-sc-test

aws:elasticbeanstalk:application:environment
