


keep enironment variables here
/etc/default/td-agent

export env="development"

<source>
  @type tail
  format apache2
  path /var/log/apache2/access.log
  pos_file /var/log/td-agent/apache2.access_log.pos
  tag kinesis.apache.access
</source>


@include /etc/td-agent/src.conf
@include /etc/td-agent/dest.conf

@INCLUDE somefile.conf

/etc/default/td-agent
/etc/sysconfig/td-agent

fluentbit
http://fluentbit.io/documentation/current/installation/ubuntu.html

wget -qO - http://packages.fluentbit.io/fluentbit.key | sudo apt-key add -

config file

http://fluentbit.io/documentation/current/configuration/schema.html


add environment variables through beanstalk


bin/fluent-bit -c fluent-bit.conf



/opt/td-agent-bit/bin/td-agent-bit
