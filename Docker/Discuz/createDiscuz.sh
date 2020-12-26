#building a mysql server for discuz
#docker run --name mysql-5.7.26 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7.26
echo "Create a mysql for Discuz?(y/n)"
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_USER=sanwenjing \
    -e MYSQL_PASSWORD=123456 \
    -e MYSQL_DATABASE=discuz \
    --name discuz_mysql\
    repo.local.com/mysql:5.7.26
fi
#building a discuz server
#docker run --name discuz --link mysql-5.7.26:mysql -p 80:80 -d skyzhou/docker-discuz
docker run --restart=always -d \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_USER=sanwenjing \
    -e MYSQL_PASSWORD=123456 \
    -e MYSQL_DATABASE=discuz \
    --link discuz_mysql:mysql \
    --name discuz\
    -p 80:80 \
    repo.local.com/discuz:20140608
echo "http://localhost/ Login and install after few seconds"

