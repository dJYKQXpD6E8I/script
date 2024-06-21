#! /bin/bash

echo -e "这会删除所有 scrcpy 容器！\n按任意键继续"
read -n 1 -s

docker remove scrcpy -f
docker remove ws-scrcpy -f

docker network create scrcpy
docker run -d --name scrcpy --restart=always \
--network=scrcpy \
-m 512m \
scavin/ws-scrcpy

docker network connect frps scrcpy
docker exec -d scrcpy adb connect frps:49565