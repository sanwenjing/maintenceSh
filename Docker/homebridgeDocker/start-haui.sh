#!/bin/sh
target=home-assistant
ver=1.0
images=repo.local.com/$target:$ver

echo "Building a server for $sn?(y/n)"
read key
if [ $key = 'y' ]; then
docker run --restart=always -d -it \
--name $target \
-v /haconfig:/config \
--net=host \
$images
fi
echo "Visit web http://localhost:8123/ via webrower"

