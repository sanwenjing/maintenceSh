FROM	repo.local.com/alpine:3.9.0
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 5060/udp 5060/tcp
#modify the repo for apk
#RUN sed -i "s/alpine.gliderlabs.com/mirrors.aliyun.com/g" /etc/apk/repositories
RUN sed -i "s/alpine.gliderlabs.com/repo.local.com:8080/g" /etc/apk/repositories

RUN apk update && \
apk add --no-cache freeswitch \ 
freeswitch-sample-config \ 
freeswitch-sounds-en-us-callie-8000 


RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
#echo "nohup /usr/sbin/php-fpm7>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/crond>/dev/null 2>&1">>/np.start && \
echo "nohup freeswitch>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
#ADD start.sh /root/
#RUN chmod +x /root/start.sh
ENTRYPOINT ["/bin/sh","/np.start"]
