以测试环境：
nginx1.16.0(这个无所谓)
php 5.6 (试过 php 7.0打不开 其他自测)
mysql 8.0.16 （这个其他的应该也可以，问题不大）

安装说明：
请按照以下方法安装程序
1、首先把更目录的erpv8.sql导入到数据库
2、打开application\config\database.php文件，找到数据库配置字段

如下：
$db[‘default’][‘hostname’] = ‘localhost’;  //一般默认即可
$db[‘default’][‘username’] = ‘root’;   //数据库用户名
$db[‘default’][‘password’] = ‘root’;  //数据库密码
$db[‘default’][‘database’] = ‘erpv8’;  //数据库名称

3、访问您的网址  账号为 admin  密码为 admin888
