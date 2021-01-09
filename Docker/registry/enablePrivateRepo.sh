#!/bin/sh
sed -i "s/--insecure-registry 127.0.0.1:5000/--insecure-registry 127.0.0.1:5000 --insecure-registry repo.local.com/g" /usr/lib/systemd/system/docker.service
systemctl daemon-reload
systemctl restart docker
