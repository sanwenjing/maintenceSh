echo "Open root remote access?(y/n)"
read key
if [ $key = 'y' ]; then
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
flush privileges;
fi

