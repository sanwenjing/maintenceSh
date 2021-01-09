#FROM	repo.local.com/php7-nginx:1.0
FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 80 
ADD repositories /etc/apk/repositories
RUN apk update && \
apk add --no-cache php7 nginx \
php7-mysqli \
php7-pdo_mysql \
php7-mbstring \
php7-json \
php7-zlib \
php7-gd \
php7-intl \
php7-session \
php7-fpm \
php7-memcached && \
mkdir /run/nginx && \
touch /run/nginx/nginx.pid && \
apk add --no-cache openrc && \
rc-update add php-fpm7 && \
rc-update add nginx
RUN mkdir -p /run/openrc && \
touch /run/openrc/softlevel
#add config for php
ADD www.conf /etc/php7/php-fpm.d/www.conf
#add config for nginx
ADD default.conf /etc/nginx/conf.d/default.conf


RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
echo "nohup /usr/sbin/php-fpm7>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/nginx>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
#ADD start.sh /root/
#RUN chmod +x /root/start.sh
CMD /bin/sh /np.start
