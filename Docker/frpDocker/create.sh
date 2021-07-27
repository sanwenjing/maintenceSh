#!/bin/sh
sn=alpine-frp
ver=0.37
echo "Building a server for $sn?(y/n)"
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    --name $sn \
repo.local.com/$sn:$ver    
#sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"

