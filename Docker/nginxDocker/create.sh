#!/bin/sh
sn=alpine-nginx-repo
ver=1.14.2
echo "Building a server for $sn?(y/n)"
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    --name $sn \
    -v /html:/html \
    -p 80:80 \
repo.local.com/$sn:$ver    
#sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"

