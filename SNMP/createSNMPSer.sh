#!/bin/bash
yum -y install net-snmp net-snmp-utils
snmpd -v
systemctl start snmpd.service
systemctl enable snmpd.service
