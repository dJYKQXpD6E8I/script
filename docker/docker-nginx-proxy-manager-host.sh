#! /bin/bash

echo -e "这会删除所有 nginx 容器！\n按任意键继续"
read -n 1 -s

docker remove nginx -f
docker remove nginx-proxy-manager -f

docker run -d --name nginx --restart=always \
-m 512m \
--network=host \
-v $HOME/docker/nginx/data:/data \
-v $HOME/docker/nginx/letsencrypt:/etc/letsencrypt \
jc21/nginx-proxy-manager

docker exec -it nginx bash -c "export http_proxy=http://172.17.0.5:7890 &&
export https_proxy=http://172.17.0.5:7890 &&
apt update &&
apt install -y systemctl"
