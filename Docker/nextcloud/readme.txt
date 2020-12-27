nextcloud 中文乱码解决方案
修改/nextcloud/lib/public/AppFramework/Http/FileDisplayResponse.php文件

第68行注销掉
修改为
$fileContents=$this->file->getContent();
$encoding = mb_detect_encoding($fileContents . "a", "UTF-8,GB2312, GBK, WINDOWS-1252, ISO-8859-15, ISO-8859-1, ASCII", true);
if ($encoding === "") {
$encoding = "ISO-8859-15";
}
$fileContents = iconv($encoding, "UTF-8", $fileContents);
$output->setOutput($fileContents);

无法删除文件,在主机中加入crontab任务
*/5 * * * * docker exec -it nextcloud /usr/local/bin/php ./cron.php
