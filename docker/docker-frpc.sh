#! /bin/bash

echo -e "这会删除所有 frpc 容器！\n按任意键继续"
read -n 1 -s

docker remove frpc -f
docker run -d --name frpc --restart=always \
-m 512m \
stilleshan/frpc

docker cp frpc.toml frpc:/frp/