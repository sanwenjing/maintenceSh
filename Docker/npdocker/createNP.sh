#building a server for np
echo "Building a server for np?(y/n)"
#docker run -d --name showdoc -p 4999:80 showdoc
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    --name web \
    -p 80:80 \
    -v /html:/html \
    repo.local.com/np:1.1
    #sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"

