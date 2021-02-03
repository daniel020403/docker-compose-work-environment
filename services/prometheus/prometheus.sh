#!/bin/sh
exec /opt/prometheus-2.22.1.linux-amd64/prometheus --config.file=/root/.config/prometheus.yml >> /var/log/prometheus.log 2>&1