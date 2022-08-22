FROM	repo.local.com/alpine:3.9.0
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 80 443
#modify the repo for apk
#RUN sed -i "s/alpine.gliderlabs.com/mirrors.aliyun.com/g" /etc/apk/repositories
RUN sed -i "s/alpine.gliderlabs.com/repo.local.com:8080/g" /etc/apk/repositories

WORKDIR /html

RUN apk update && \
apk add --no-cache php7 nginx tzdata php7-fpm php7-gd php7-mbstring php7-json php7-xml \
php7-opcache php7-curl php7-mysqli php7-pdo_mysql php7-pdo_sqlite && \
mkdir /run/nginx && \
touch /run/nginx/nginx.pid && \
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai"> /etc/timezone
RUN mkdir -p /run/openrc && \
touch /run/openrc/softlevel
#modify config for php
RUN sed -i "s/user = nobody/user = nginx/g" /etc/php7/php-fpm.d/www.conf && \
sed -i "s/group = nobody/group = nginx/g" /etc/php7/php-fpm.d/www.conf
#add config for nginx
ADD default.conf /etc/nginx/conf.d/default.conf
COPY upload /html/
RUN chmod -R 777 /html

RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
echo "nohup /usr/sbin/php-fpm7>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/crond>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/nginx>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
#ADD start.sh /root/
#RUN chmod +x /root/start.sh
ENTRYPOINT ["/bin/sh","/np.start"]
