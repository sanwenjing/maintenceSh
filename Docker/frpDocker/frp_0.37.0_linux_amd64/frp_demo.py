#!/usr/bin/python
# -*- coding: UTF-8 -*-
#sakura_frp反向代理守护脚本
import os,sys;
import com;
#def checkOL():


if __name__=="__main__":
# com.bgrun("./frpc_linux_arm -c frpc.ini")
#  print com.isrun("frpc_linux_arm")
            progName="frpc"
            cmdline="/usr/program/sshproxy/frp2/frpc -c /usr/program/sshproxy/frp2/frpc.ini"
            log1=com.log("/usr/program/sshproxy/frp/frp.log")
            if(len(sys.argv)>=2):
                cmd=com.getArgs(1);
                if(cmd=="stop"):
                    com.killByKw(progName);
                elif(cmd=="restart"):
                    print("killlinks:");
                    com.killByKw(progName);
                    com.sleep(1);
                    com.bgrun(cmdline)
                elif(cmd=="start"):
                    if not com.isrun(progName):
                      com.bgrun(cmdline)
                      log1.w("frp started!")



