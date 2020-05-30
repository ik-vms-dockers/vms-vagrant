#!/usr/bin/env bash
echo "======================================="
echo "Fluentd Aggregator Service"
echo "======================================="

EMBEDDED_BIN='/opt/td-agent/embedded/bin'
FLUENT_GEM="${EMBEDDED_BIN}/fluent-gem"
CONFIG_LOCATION='/etc/td-agent/td-agent.conf'
LOG_ROOT_DIR='/applicationlogs/'

echo "==============="
echo "Install Fluentd"
echo "==============="
curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh

echo "======================================="
echo "Fluentd Setup Permissions and Plugins"
echo "======================================="
sudo -k
sudo sh <<SCRIPT
if [ ! -d "$DIRECTORY" ]; then
mkdir "${LOG_ROOT_DIR}"
chown -R td-agent:td-agent "${LOG_ROOT_DIR}"
fi
$FLUENT_GEM install fluent-plugin-forest
/etc/init.d/td-agent restart

cat >${CONFIG_LOCATION} <<"EOF";
####
## Output descriptions:
##

<source>
  @type forward
  bind 0.0.0.0
  port 24224
</source>

<match prefix.**>
  @type forest
  subtype file
  <template>
    time_slice_format %Y%m%d%H
    path /applicationlogs/\${tag_parts[1]}/\${tag_parts[2]}/\${tag_parts[3]}/\${tag_parts[4]}.log
    time_format %Y/%m/%d-%H:%M:%S
    buffer_type file
    buffer_path /var/log/td-agent/buffer/\${tag_parts[-1]}.*.\${tag_parts[-2]}
    flush_interval 1s
    flush_at_shutdown true
    append true
  </template>
</match>
EOF

/etc/init.d/td-agent restart
SCRIPT

echo "====================="
echo "Installation complete"
echo "====================="
