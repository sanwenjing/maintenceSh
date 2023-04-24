# -*- coding: utf-8 -*-
import os
import time

# 设置要删除日志文件的目录列表
log_dirs = ['/home/fanruan/tomcat/logs/']

# 计算7天前的时间戳
seven_days_ago = time.time() - (7 * 24 * 60 * 60)

# 遍历每个目录，获取该目录下的所有文件列表，并筛选出需要删除的日志文件
for log_dir in log_dirs:
    files = os.listdir(log_dir)
    for file_name in files:
        # 判断当前文件是否是日志文件（这里以".log"后缀为例）
        if file_name.endswith('.log'):
            file_path = os.path.join(log_dir, file_name)
            create_time = os.path.getctime(file_path)
            # 判断文件是否创建时间在7天之前
            if create_time < seven_days_ago:
                # 如果是，则删除该文件
                os.remove(file_path)
                print('已删除旧日志文件：{}'.format(file_path))

print('日志清理完成。')
