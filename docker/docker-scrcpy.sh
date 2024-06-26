#! /bin/bash

echo -e "这会删除所有 scrcpy 容器！\n按任意键继续"
read -n 1 -s

docker remove scrcpy -f
docker remove ws-scrcpy -f

docker run -d --name scrcpy --restart=always \
-m 512m \
scavin/ws-scrcpy

docker network create scrcpy
docker network connect scrcpy scrcpy
docker network connect scrcpy clash

docker cp scrcpy-keep-alive.sh scrcpy:/root/
docker exec scrcpy bash -c 'export http_proxy="http://clash:7890" &&
apt update &&
apt install -y cron &&
echo "crontab -l && cron" > /root/.bashrc &&
echo "* * * * * bash /root/scrcpy-keep-alive.sh" >> /etc/crontab &&
crontab /etc/crontab &&
cron'