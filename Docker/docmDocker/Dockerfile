FROM	repo.local.com/alpine:3.9.0
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
ENV root /html
ENV CATALINA_HOME /opt/tomcat
EXPOSE 8080
#modify the repo for apk
RUN sed -i "s/alpine.gliderlabs.com/repo.local.com:8080/g" /etc/apk/repositories


RUN apk update && \
apk add --no-cache tzdata openjdk7-jre && \
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai"> /etc/timezone


##ADD files
RUN  mkdir -p ${CATALINA_HOME} && ln -s ${CATALINA_HOME}/webapps ${root} 
ADD tomcat ${CATALINA_HOME}/
#COPY web ${root}/
#RUN chmod -R 777 ${root}
#modify config for osticket

#RUN cp /html/include/ost-sampleconfig.php /html/include/ost-config.php && \
#chmod 0666 /html/include/ost-config.php && \
##add crontab
#echo "*/1 * * * * /usr/bin/php /html/api/cron.php>/dev/null 2>&1">>/var/spool/cron/crontabs/root

RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
#echo "nohup /usr/sbin/nginx>/dev/null 2>&1">>/np.start && \
#echo "nohup /usr/sbin/php-fpm7>/dev/null 2>&1">>/np.start && \
echo "nohup /opt/tomcat/bin/catalina.sh run>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/crond>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
CMD /bin/sh /np.start
