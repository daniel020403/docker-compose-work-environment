#!/bin/sh
exec /opt/grafana-7.2.2/bin/grafana-server -homepath /opt/grafana-7.2.2/>> /var/log/grafana.log 2>&1