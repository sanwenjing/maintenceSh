image=bjdgyc/anylink
confdir=/home/data/anylink/
echo 'Input your password for admin E.g 123@qwe'
read key
docker run -it --rm $image tool -p $key
echo 'secret'
docker run -it --rm $image tool -s
docker run -itd --name anylink --privileged=true $image
mkdir -p $confdir
docker cp anylink:/app/conf $confdir/
docker stop anylink
docker rm anylink
echo 'Pls modify the server.toml by vi '$confdir'conf/server.toml'
chmod -R 777 $confdir'conf/server.toml'
