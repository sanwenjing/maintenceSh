#building a server for Minecraft
echo "Building a server for Minecraft?(y/n)"
#docker run -d --name showdoc -p 4999:80 showdoc
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    --name mc1 \
    -p 25565:25565 \
    -v /data/myworld/world:/world \
    repo.local.com/minecraft:1.7.10
fi
echo "Connect the game with your client."

