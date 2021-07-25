FROM	nimmis/apache-php5
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 80
#modify the repo for apk
#RUN sed -i "s/alpine.gliderlabs.com/mirrors.aliyun.com/g" /etc/apk/repositories
#ADD repositories /etc/apk/repositories

#RUN apk update && \
#apk add --no-cache tzdata && \ 
#cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
#echo "Asia/Shanghai"> /etc/timezone 

#install php5 and nginx
#RUN apk add --no-cache php5 nginx php5-mysql php5-fpm php5-json \
#&& \
#mkdir /run/nginx && \
#touch /run/nginx/nginx.pid


#modify config for php
#RUN sed -i "s/user = nobody/user = nginx/g" /etc/php5/php-fpm.conf && \
#sed -i "s/group = nobody/group = nginx/g" /etc/php5/php-fpm.conf && \
#sed -i "s/include =/#include =/g" /etc/php5/php-fpm.conf
#add config for nginx
#ADD default.conf /etc/nginx/conf.d/default.conf

##ADD files
RUN ln -s /var/www/html /html && \
echo "<?php echo phpinfo(); ?>">/html/phpinfo.php
COPY erpV8 /html/
RUN chmod -R 777 /html
#modify config for osticket

#RUN cp /html/include/ost-sampleconfig.php /html/include/ost-config.php && \
#chmod 0666 /html/include/ost-config.php && \
##add crontab
#echo "*/1 * * * * /usr/bin/php /html/api/cron.php>/dev/null 2>&1">>/var/spool/cron/crontabs/root

RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
#echo "nohup /usr/bin/php-fpm>/dev/null 2>&1">>/np.start && \
#echo "nohup /usr/sbin/nginx>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/crond>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
CMD /bin/sh /np.start
