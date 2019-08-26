import os,com
json="""{
         \\"alert\\": true,
         \\"autorespond\\": true,
         \\"source\\": \\"API\\",
         \\"name\\": \\"sanwenjing\\",
         \\"email\\": \\"sanwenjing@163.com\\",
         \\"phone\\": \\"18888888888\\",
         \\"subject\\": \\"title\\",
         \\"ip\\": \\"127.0.0.1\\",
         \\"message\\": \\"content\\"
        }"""

if __name__=="__main__":
 args1=com.getArgs(1)
 args2=com.getArgs(2)
 if args1 != "":
    print args1
    json=json.replace("title",args1)
 if args2 != "":
    print args2
    json=json.replace("content",args2)
 if args1=="" or args2=="": 
    print "Not enough arguments. Ex. "+com.getFileName()+" Title content"
    exit()
 
 #print json;
 cmd="curl -d \""+json+"\" -H \"X-API-Key:7C1AF2BFAB23ED5675F85EDAEA64FDDE\" http://127.0.0.1/api/tickets.json"
 #print cmd
 val=os.system("curl -d \""+json+"\" -H \"X-API-Key:7C1AF2BFAB23ED5675F85EDAEA64FDDE\" http://127.0.0.1/api/tickets.json")
 print val

