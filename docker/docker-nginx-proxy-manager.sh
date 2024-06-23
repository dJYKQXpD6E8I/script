#! /bin/bash

echo -e "这会删除所有 nginx 容器！\n按任意键继续"
read -n 1 -s

docker remove nginx -f
docker remove nginx-proxy-manager -f

docker run -d --name nginx --restart=always \
--network=host \
-v $HOME/docker/nginx/data:/data \
-v $HOME/docker/nginx/letsencrypt:/etc/letsencrypt \
jc21/nginx-proxy-manager
