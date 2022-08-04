FROM	repo.local.com/alpine:3.9.0
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
#EXPOSE 80 443 
#modify the repo for apk
#RUN sed -i "s/alpine.gliderlabs.com/mirrors.aliyun.com/g" /etc/apk/repositories
RUN sed -i "s/alpine.gliderlabs.com/repo.local.com:8080/g" /etc/apk/repositories

RUN apk update && \
apk add --no-cache nginx tzdata && \ 
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai"> /etc/timezone 

#install php7 and nginx
RUN mkdir /run/nginx && \
touch /run/nginx/nginx.pid


#add config for nginx
ADD default.conf /etc/nginx/conf.d/default.conf
ADD ssl.conf /etc/nginx/conf.d/ssl.conf

##ADD files
WORKDIR /html

VOLUME /html
VOLUME /etc/nginx/cert

RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
echo "nohup /usr/sbin/nginx>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/crond>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
ENTRYPOINT ["/bin/sh","/np.start"]
