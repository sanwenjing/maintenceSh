#创建数据目录
mkdir -p /usr/thedude/data
#创建容器
docker run --restart=always -d --name thedude -p 2210:2210 -p 2211:2211 -v /etc/localtime:/etc/localtime:ro -v /usr/thedude/data:/srv/dude/drive_c/"Program Files"/Dude/data dlinniy/thedude dude
echo "user:admin"
echo "passwd:NULL"
