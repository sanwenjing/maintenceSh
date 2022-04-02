FROM	repo.local.com/alpine:3.9.0
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
ENV frp /usr/program/frps

EXPOSE 7000
#modify the repo for apk
RUN sed -i "s/alpine.gliderlabs.com/repo.local.com:8080/g" /etc/apk/repositories

RUN apk update && \
apk add --no-cache tzdata && \ 
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai"> /etc/timezone 

#install php7 and nginx
#RUN apk add --no-cache php7 nginx php7-mysqli php7-pdo_mysql php7-fpm php7-gd php7-mbstring \
#php7-pear php7-xml php7-xmlrpc php7-phar php7-pecl-apcu php7-opcache php7-dom \
#php7-json php7-simplexml php7-curl php7-iconv php7-imap \
#php7-ldap php7-zlib php7-intl php7-session php7-memcached \
#&& \
#mkdir /run/nginx && \
#touch /run/nginx/nginx.pid


#modify config for php
#RUN sed -i "s/user = nobody/user = nginx/g" /etc/php7/php-fpm.d/www.conf && \
#sed -i "s/group = nobody/group = nginx/g" /etc/php7/php-fpm.d/www.conf
#add config for nginx
#ADD default.conf /etc/nginx/conf.d/default.conf

##ADD files
RUN mkdir -p ${frp}
#echo "<?php echo phpinfo(); ?>">/html/phpinfo.php
ADD ./frps/* ${frp}/
#COPY frp_* ${frp}/
#RUN sed -i "s/12345678/${token}/g" ${frp}/frps.ini && \
RUN chmod -R 777 ${frp}
#modify config for osticket

#RUN cp /html/include/ost-sampleconfig.php /html/include/ost-config.php && \
#chmod 0666 /html/include/ost-config.php && \
##add crontab
#echo "*/1 * * * * /usr/bin/php /html/api/cron.php>/dev/null 2>&1">>/var/spool/cron/crontabs/root

RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
echo "nohup ${frp}/frps -c ${frp}/frps.ini>/dev/null 2>&1">>/np.start && \
#echo "nohup /usr/sbin/nginx>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/crond>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
ENTRYPOINT ["/bin/sh","/np.start"]
