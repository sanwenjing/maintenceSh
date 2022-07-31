echo "Open root remote access?(y/n)"
read key
if [ $key = 'y' ]; then
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
flush privileges;
fi

echo "Do you want to reset root password?(y/n)"
read key
if [ $key = 'y' ]; then
#GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
set password for 'root'@'%' = password('123456');
flush privileges;
fi
