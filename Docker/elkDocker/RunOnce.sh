#!/bin/sh
echo "vm.max_map_count=262144" >> /etc/sysctl.conf
sysctl -p
