FROM	docker.io/sukeshss/jdk1.7
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 25565 
RUN mkdir -p /data/myworld
COPY myworld1 /data/myworld
ENTRYPOINT /usr/bin/java -Xms1G -Xmx1G -jar /data/myworld/KCauldron.jar
