#start a zabbix server by docker
#step 1
#      -d mysql:5.7  \
docker run --restart=always --name mysql-server -t \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix" \
      -e MYSQL_ROOT_PASSWORD="zabbix" \
      -d repo.local.com/mysql:5.7.26  \
--character-set-server=utf8 --collation-server=utf8_bin 

#step 2
docker run --restart=always --name zabbix-server-mysql -t \
      -e DB_SERVER_HOST="mysql-server" \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix" \
      -e MYSQL_ROOT_PASSWORD="zabbix" \
      --link mysql-server:mysql \
      -p 10051:10051 \
      -d repo.local.com/zabbix-server-mysql:20201226
#-d zabbix/zabbix-server-mysql:latest
#step 3
docker run --restart=always --name zabbix-web-nginx-mysql -t \
      -e DB_SERVER_HOST="mysql-server" \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix" \
      -e MYSQL_ROOT_PASSWORD="zabbix" \
      --link mysql-server:mysql \
      --link zabbix-server-mysql:zabbix-server \
      -p 80:8080 \
      -p 443:8443 \
      -d repo.local.com/zabbix-web-nginx-mysql:20201226

#-d zabbix/zabbix-web-nginx-mysql:latest
echo "Pls visit website localhost/zabbix and login with user Admin/zabbix after few minutes."
