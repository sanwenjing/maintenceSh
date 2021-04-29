#building a server
target=mykms
echo "Building a server for $target?(y/n)"
#docker run -d --name showdoc -p 4999:80 showdoc
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    --name $target \
    -p 1688:1688 \
    repo.local.com/$target:1.0
    #sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"

