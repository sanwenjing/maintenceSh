echo "support:https://hub.docker.com/r/devinsolutions/osticket"
#building a mysql server for osTicket
docker run --restart=always -d \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_USER=sanwenjing \
    -e MYSQL_PASSWORD=123456 \
    -e MYSQL_DATABASE=osticket \
    --name osticket_mysql\
    192.168.31.151:5000/mysql:latest
#building a osTicket server
#docker run --restart=always -d --name osticket --link osticket_mysql:mysql -p 80:80 devinsolutions/osticket
docker run --restart=always -d \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_USER=sanwenjing \
    -e MYSQL_PASSWORD=123456 \
    -e MYSQL_DATABASE=osticket \
    --link osticket_mysql:mysql \
     --name osticket\
     -p 80:80 \
     192.168.31.151:5000/osticket:20201224
echo "http://localhost/scp. Login with default admin user & password:"
echo "username: ostadmin"
echo "password: Admin1"
