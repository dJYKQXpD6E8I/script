#! /bin/bash

echo -e "这会删除所有 nginx 容器！\n按任意键继续"
read -n 1 -s

docker remove nginx -f
docker remove nginx-proxy-manager -f

docker run -d --name nginx --restart=always \
--add-host=host.docker.internal:host-gateway \
-m 512m \
-p 443:443 -p 80:80 \
-v $HOME/docker/nginx/data:/data \
-v $HOME/docker/nginx/letsencrypt:/etc/letsencrypt \
jc21/nginx-proxy-manager

docker exec -it nginx bash -c "apt update && apt install -y systemctl"
docker cp $HOME/script/docker/nginx-config.sh nginx:/root/
