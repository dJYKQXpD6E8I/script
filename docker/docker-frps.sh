#! /bin/bash

echo -e "这会删除所有 frps 容器！\n按任意键继续"
read -n 1 -s

docker remove frps -f

docker run -d --name frps --restart=always \
-m 512m \
stilleshan/frps

docker cp frps.toml frps:/frp/
docker restart frps

bash docker-frps-network.sh