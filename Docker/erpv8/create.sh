#!/bin/sh
sn=erpv8
ver=8.0
echo "Building a server for $sn?(y/n)"
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    --name $sn \
    -p 80:80 \
repo.local.com/$sn:$ver    
#sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"

