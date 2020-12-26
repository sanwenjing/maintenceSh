#building a server for showDoc
echo "Building a server for showDoc?(y/n)"
#docker run -d --name showdoc -p 4999:80 showdoc
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    --name showDoc \
    repo.local.com/showdoc:latest
fi
echo "http://localhost/ Login and install after few seconds"

