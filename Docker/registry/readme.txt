Docker����˽�вֿ�:
1.��װ(������,��192.168.92.134)
�ر�selinux
sestatus -v �鿴״̬
�޸�/etc/selinux/config�ļ�����SELINUX=enforcing��ΪSELINUX=disable��������ϵͳ.

���ز�����һ��registry������-vָ�������ļ����ش��·��

docker run --restart=always -d -p 5000:5000 -v /opt/data/registry:/var/lib/registry --name private_registry registry

2.�ϴ�����(�ͻ���)
ʹ��docker tag���������Ϊ192.168.92.134:5000/test

docker tag ubuntu:18.04 192.168.92.134/test
���͵����زֿ�

docker push 192.168.92.134:5000/test

ע:����ϴ�ʧ��
vim /usr/lib/systemd/system/docker.service
��--insecure-registry 127.0.0.1:5000���������һ���������ݼ��ɽ��

--insecure-registry 192.168.92.134:5000
3.�鿴�ֿ�
http://192.168.92.134:5000/v2/_catalog

