

printenv
[Setup](https://docs.fluentd.org/v0.12/articles/install-by-deb)

config file location
/etc/td-agent/td-agent.conf

start ui
make it run un silent mode
sudo /usr/sbin/td-agent-ui start

username=“admin” and password=“changeme”

curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent2.sh | sh

Launc daemon
/etc/init.d/td-agent restart
/etc/init.d/td-agent status

curls
```bash
  curl -X POST -d 'json={"json":"message"}' http://localhost:8888/app.access
```


fluent-plugin-record-reformer
