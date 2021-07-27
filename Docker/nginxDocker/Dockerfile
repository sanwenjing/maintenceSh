FROM	repo.local.com/alpine:3.9.0
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
ENV html /html
EXPOSE 80
#modify the repo for apk
RUN sed -i "s/alpine.gliderlabs.com/mirrors.aliyun.com/g" /etc/apk/repositories

RUN apk update && \
apk add --no-cache tzdata && \ 
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai"> /etc/timezone 

#install php7 and nginx
RUN apk add --no-cache nginx && \
mkdir /run/nginx && \
touch /run/nginx/nginx.pid


#modify config for php
#RUN sed -i "s/user = nobody/user = nginx/g" /etc/php7/php-fpm.d/www.conf && \
#sed -i "s/group = nobody/group = nginx/g" /etc/php7/php-fpm.d/www.conf
#add config for nginx
ADD default.conf /etc/nginx/conf.d/default.conf

##ADD files
RUN mkdir -p ${html}&& \
#echo "<?php echo phpinfo(); ?>">${html}/phpinfo.php
#ADD frp_0.37.0_linux_amd64.tar.gz frp_0.37.0_windows_amd64.zip ${frp}/
#COPY frp_* ${frp}/
chmod -R 777 ${html}
#modify config for osticket

#RUN cp /html/include/ost-sampleconfig.php /html/include/ost-config.php && \
#chmod 0666 /html/include/ost-config.php && \
##add crontab
#echo "*/1 * * * * /usr/bin/php /html/api/cron.php>/dev/null 2>&1">>/var/spool/cron/crontabs/root

RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
echo "nohup /usr/sbin/nginx>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/crond>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
CMD /bin/sh /np.start
