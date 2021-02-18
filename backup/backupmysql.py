#!/bin/python
import com,os
dbname='newost'
path='/data/dbbak'
os.system('mkdir -p '+path)
backupfilename=path+'/'+dbname+com.getTimeFormat('%Y%m%d%H%M%S')+'.sql'

os.system('mysqldump -uroot '+dbname+'>'+backupfilename)
print com.getTimeFormat('%Y%m%d%H%M%S')
print backupfilename
