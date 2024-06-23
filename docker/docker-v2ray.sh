#! /bin/bash

PORT=38103

echo -e "这会删除所有 v2ray 容器！\n按任意键继续"
read -n 1 -s

docker remove v2ray -f
docker remove v2fly -f
docker run -d --name v2ray \
--restart=always \
-p $PORT:10086 \
v2fly/v2fly-core \
run -c /etc/v2ray/config.json 

docker cp v2ray.json v2ray:/etc/v2ray/config.json
docker restart v2ray