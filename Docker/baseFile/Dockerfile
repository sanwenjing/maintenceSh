FROM	repo.local.com/alpine:3.9.0
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 80 443
#modify the repo for apk
RUN sed -i "s/alpine.gliderlabs.com/mirrors.aliyun.com/g" /etc/apk/repositories

RUN apk update && \
apk add --no-cache php7 nginx \
php7-mysqli \
php7-pear php7-xml php7-xmlrpc php7-phar php7-pecl-apcu php7-opcache php7-dom \
php7-pdo_mysql php7-mbstring php7-json php7-simplexml php7-curl php7-iconv \
php7-pecl-mcrypt php7-sqlite3 php7-mysqlnd php7-pdo_sqlite exiftool zip unzip \
php7-imap php7-ldap tzdata php7-zlib php7-gd php7-intl php7-session php7-fpm \
php7-memcached && mkdir /run/nginx && touch /run/nginx/nginx.pid && \
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai"> /etc/timezone 

#modify config for php
RUN sed -i "s/user = nobody/user = nginx/g" /etc/php7/php-fpm.d/www.conf && \
sed -i "s/group = nobody/group = nginx/g" /etc/php7/php-fpm.d/www.conf && \
sed -i "s/short_open_tag = Off/short_open_tag = On/g" /etc/php7/php.ini
#add config for nginx
ADD default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /html
COPY . /html/

#modify config for osticket

#RUN cp /html/include/ost-sampleconfig.php /html/include/ost-config.php && \
#chmod 0666 /html/include/ost-config.php && \
#echo "*/1 * * * * /usr/bin/php /html/api/cron.php>/dev/null 2>&1">>/var/spool/cron/crontabs/root

RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
echo "nohup /usr/sbin/php-fpm7>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/nginx>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/crond>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
#ADD start.sh /root/
#RUN chmod +x /root/start.sh
CMD /bin/sh /np.start
