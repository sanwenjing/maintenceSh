#!/usr/bin/python
# -*- coding: UTF-8 -*-
import os,sys,time,random;
import datetime as dt;
import platform as pf;
class log:
      fd="";
      def __init__(self,fileaddr=""):
            filepath=getArgs(0);
            if(fileaddr):
                  self.fd=fileaddr;
            else:
                  self.fd=getRunPath()+"/"+getFileName()+".log";
      def getFd(self):
            return(self.fd);
      def w(self,text):
            of=open(self.fd,'a');
            of.write(getTime()+"  "+text+"\r\n");
            of.close();
            return;
def getArgs(position):
    if(len(sys.argv)>=position+1):
        return sys.argv[position];
    else:
        return "";
def getAddrStr(address):
      if getSystemClass()=="Windows":
            return address.replace("/","\\");
      else:
            return address.replace("\\","/");
def getTime():
      return getTimeFormat('%Y-%m-%d %H:%M:%S');
def getTimeFormat(format):
      now=dt.datetime.now();
      return now.strftime(format);
def getHM():
    return getTimeFormat("%H:%M");
def sleep(seconds):#延时程序
      time.sleep(seconds);
def getFileName():
    fn=sys.argv[0][sys.argv[0].rfind(os.sep) + 1:];
    return fn.split(".")[0];

def getSystemClass():
      return pf.system();
def getRunPath():
    curPath=getArgs(0);
    if curPath[0]!="/":
        return getLeft(os.getcwd()+"/"+ curPath,"/");
    else:
        return getLeft(curPath,"/");
def getLeft(string,keyword):
    keyposition=string.rfind(keyword)
    if keyposition>=0:
        return string[0:keyposition];
    else:
        return string;
def killByKw(keyword):#命令行关键字终结程序
      os.system("ps -ef|grep "+keyword+" |awk '{print $2}'|xargs kill -9");
def getHtml(url):#取HTML代码,利用CURL
    html=os.popen("curl "+url)
    htmltxt=""
    while 1:
        line=html.readline()
        if line:
            htmltxt+=line
        else:
            break
    return htmltxt
def isrun(keyword):#判断运行状态
    rs=os.popen("ps -ef |grep '"+keyword+"'|grep -v grep")
    if rs.readline():
        return 1
    else:
        return 0
        
#For adb to get multi devices id
def getDevID():
  if getSystemClass()=="Windows":
    r=os.popen("adb devices |findstr /V devices")
  else:
    r=os.popen("adb devices |grep -v devices")
  #text=r.read()
  #print text
  output=[]
  while 1:
    line=r.readline()
    if not line:
      break
    res=getLeft(line,"device").rstrip()
    #Exit if nothing
    if len(res)==0:
      break
    #print res
    #swipe(res)
    output.append(res)
  r.close()
  return output
  
#send a adb command for swiping
def swipe(DevID):
  x1=291+random.randint(1,100)
  y1=726+random.randint(-50,50)
  x2=291+random.randint(1,100)
  y2=243+random.randint(-50,50)
  #sleepTime=random.randint(1,5)
  #time.sleep(sleepTime)
  cmdline="adb -s {dev} shell input swipe {x1} {y1} {x2} {y2} 200".format(dev=DevID,x1=x1,y1=y1,x2=x2,y2=y2)
  os.system(cmdline)
  #print cmdline

#run cmd bg
def bgrun(cmd):
  cmdline="nohup {cmd}>/dev/null 2>&1 &".format(cmd=cmd)
  print cmdline
  os.system(cmdline)

def isrun(progName):
  r=os.popen("ps -ef|grep {kw}|wc -l".format(kw=progName))
  res=r.readline()
  r.close()
#  print res
#  print int(res)
  if int(res)>2:
    return True
  else:
    return False

if __name__=="__main__":
         log1=log();
         print log1.getFd();
         print getLeft("234234fffssf","/");
         print("//\\".replace("/","\\"));
         print getRunPath();
         print getHM();
         print getSystemClass()
         if getSystemClass()=="Windows":
            print "win"
         #log1.w("test");
         #print getHtml("www.baidu.com")         
