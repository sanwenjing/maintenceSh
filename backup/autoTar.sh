#!/bin/sh
echo $0' objName yourBakDir yourObjPath'
dt=`date '+%Y%m%d%H%M%S'`
cd $2
tar zcvf ${dt}.$1.tar.gz $3

find ./ -name '*.gz' -atime +7 -exec rm -rf {} \;
