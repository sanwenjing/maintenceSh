FROM	repo.local.com/alpine:3.9.0
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 1688
#modify the repo for apk
RUN sed -i "s/alpine.gliderlabs.com/mirrors.aliyun.com/g" /etc/apk/repositories

RUN apk update && \
apk add --no-cache php7 nginx \
tzdata && \
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai"> /etc/timezone
#add kms bin
ADD vlmcsd-x64-musl-static /bin/kmsserver

RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
echo "nohup /bin/kmsserver>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
#ADD start.sh /root/
#RUN chmod +x /root/start.sh
CMD /bin/sh /np.start
