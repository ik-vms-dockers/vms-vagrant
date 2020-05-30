
Docker instance
https://github.com/fluent/fluent-bit-docker-image/blob/master/0.12/Dockerfile


parsers
https://github.com/fluent/fluent-bit-docker-image/blob/master/0.12/parsers.conf


[SERVICE]
    # daemon on when running on beanstalk.
    Flush     2
    Daemon    off
    Log_Level info

@INCLUDE  outputs.conf


a. /var/log/application.log
b. /var/log/Dwaccess.log
c. /var/log/Web-1.log
d. /var/log/Web-1.error.log
e. /var/log/nginx/access.log

~/applicationlogs/<environmentname>/<dev|prod>/<hostname>/


[FILTER]
   Name record_modifier
   Match *
   Record hostname ${HOSTNAME}

buffering and retry limit
https://github.com/fluent/fluent-bit/issues/328

eval `ssh-agent -s`

[INPUT]
   Name cpu
   Tag  prefix.testenvironment.dev.${HOSTNAME}.cpu


   Deploy to aws
http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create-deploy-python-container.html



Initially, you may see a file which looks like "/path/to/file.20140101.log.b4eea2c8166b147a0". This is an intermediate buffer file ("b4eea2c8166b147a0" identifies the buffer). Once the content of the buffer has been completely flushed, you will see the output file without the trailing identifier.


Hot to use scripts
curl -L https://s3.eu-west-2.amazonaws.com/fluentd-ivanka/serversetup.sh | sh

curl -L
