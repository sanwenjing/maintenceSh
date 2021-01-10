FROM	repo.local.com/alpine:3.9.0
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 8200
#modify the repo for apk
RUN sed -i "s/alpine.gliderlabs.com/mirrors.aliyun.com/g" /etc/apk/repositories

RUN apk update && \
apk add --no-cache minidlna && \
mkdir /videodata 
#modify config for dlna
RUN sed -i "s/media_dir=\/opt/media_dir=V,\/videodata/g" /etc/minidlna.conf && \
sed -i "s/#friendly_name/friendly_name/g" /etc/minidlna.conf

RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
echo "nohup /usr/sbin/minidlnad>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
CMD /bin/sh /np.start
