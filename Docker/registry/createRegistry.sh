#!/bin/bash
#clear the old container
case $1 in
"del")
echo "del"$2
if [ !$2 ]; then
docker stop $2
docker rm $2
fi
;;
*)
echo "del containerName";;
esac




datapath=/home/registry
echo "Create a server for registry?(y/n)"
read key
if [ $key = 'y' ]; then
mkdir -p $datapath
chmod -R 777 $datapath
#building a registry server
docker run --restart=always -d \
    -v $datapath:/var/lib/registry \
    -p 80:5000 \
    --name registry \
    repo.local.com/registry:latest
fi
echo "visit http://localhost/v2/_catalog after few minutes"

