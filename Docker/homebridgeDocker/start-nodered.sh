#!/bin/sh
target=node-red
ver=2.2.2
images=repo.local.com/$target:$ver

echo "Building a server for $sn?(y/n)"
read key
if [ $key = 'y' ]; then
docker run --restart=always -d -it \
--name $target \
-p 1880:1880 \
$images
fi
echo "Visit web http://localhost:1880/ via webrower"

