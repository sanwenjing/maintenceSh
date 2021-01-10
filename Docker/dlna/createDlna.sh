#building a server for dlna
echo "Building a server for dlna?(y/n)"
#docker run -d --name showdoc -p 4999:80 showdoc
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    --name dlna \
    --net host \
    -v /videodata:/videodata \
    repo.local.com/dlna:1.0
    #sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"

