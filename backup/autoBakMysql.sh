#!/bin/sh
echo $0' dbhost dbuser dbpass bakpath dbname'
dt=`date '+%Y%m%d%H%M%S'`
mysqldump -h$1 -u$2 -p$3 -B $5 > $4/${dt}.sql
cd $4
tar -zcvf $5${dt}.sql.tar.gz ${dt}.sql
rm -rf ${dt}.sql

#find $4 -name *.gz -atime +7 -exec rm -rf {} \;
