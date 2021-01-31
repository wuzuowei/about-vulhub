#！/bin/bash

## 自动更新vulhub项目

# 先备份之前的配置（备份整个文件夹）
cp -r vulhub-master vulhub-master-bak


## 删除之前的压缩包（不论是否存在）
rm vulhub-master.zip >/dev/null 2>&1

## 更改文件夹名称，防止新下载的压缩包解压时冲突
mv vulhub-master vulhub-master-old


## 下载
## wget https://github.com/vulhub/vulhub/archive/master.zip -O vulhub-master-update.zip

wget https://github.com/vulhub/vulhub/archive/master.zip -O vulhub-master.zip


## 题外话：unzip解压的时候如何重命名？？
unzip vulhub-master.zip

# replace 
# print "n"|cp -i a1 a2
awk 'BEGIN { cmd="cp -ri vulhub-master/* vulhub-master-old/"; print "n" |cmd; }'

# 收尾工作
rm vulhub-master.zip
rm -rf vulhub-master

# 还原文件名
mv vulhub-master-old vulhub-master

## 结束？