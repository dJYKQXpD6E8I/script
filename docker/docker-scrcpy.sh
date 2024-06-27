#! /bin/bash

echo -e "这会删除所有 scrcpy 容器！\n按任意键继续"
read -n 1 -s

docker remove scrcpy -f
docker remove ws-scrcpy -f

docker run -d --name scrcpy --restart=always \
-m 512m \
scavin/ws-scrcpy