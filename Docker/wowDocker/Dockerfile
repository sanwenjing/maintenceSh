FROM	ubuntu:20220802
#FROM	repo.local.com/alpine:3.9.0
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 3724/tcp 8085/tcp
#modify the repo for apk
#RUN sed -i "s/alpine.gliderlabs.com/repo.local.com:8080/g" /etc/apk/repositories

#RUN apk update && \
#RUN apt update && apt install -y screen patch libmysql++-dev libtool libssl-dev zlibc libbz2-dev libboost-all-dev
#apk add --no-cache tzdata && \ 
#cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
#echo "Asia/Shanghai"> /etc/timezone 


#ADD config.json /root/.homebridge/

WORKDIR /usr/program/bin

COPY program /usr/program

RUN touch ./np.start && \
chmod +x run-mangosd && \
echo "#!/bin/sh">>./np.start && \
echo "nohup /usr/sbin/crond>/dev/null 2>&1">>./np.start && \
echo "nohup ./realmd &">>./np.start && \
echo "./run-mangosd start">>./np.start && \
echo "tail -f /etc/hosts">>./np.start

ENTRYPOINT ["/bin/sh","./np.start"]
