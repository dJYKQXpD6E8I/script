#! /bin/bash

PORT=30038

echo -e "这会删除所有 squid 容器！\n按任意键继续"
read -n 1 -s

docker container remove squid -f
docker run --name squid -d --restart=always \
  --publish $PORT:3128 \
ubuntu/squid

docker cp squid_passwd squid:/etc/squid/
docker cp squid.conf squid:/etc/squid/
docker restart squid