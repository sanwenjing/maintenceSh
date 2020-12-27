echo "Create a server for Nextcloud?(y/n)"
read key
if [ $key = 'y' ]; then
#mkdir -p /home/ncdata
#chmod -R 777 /home/ncdata
docker run -d --restart=always \
-v nextcloud:/var/www/html \
--name nextcloud \
-p 80:80 repo.local.com/nextcloud
fi
echo "http://localhost/ Login and install after few minutes"

