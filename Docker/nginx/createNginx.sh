#building a server for Nginx
echo "Building a server for Nginx?(y/n)"
#docker run -d --name showdoc -p 4999:80 showdoc
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    --name nginx \
    -p 80:80 \
    repo.local.com/nginx:1.19.6
fi
echo "Visit web http://localhost/ via webrower"

