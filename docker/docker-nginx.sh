#! /bin/bash

echo -e "这会删除所有 nginx 容器！\n按任意键继续"
read -n 1 -s

docker remove nginx -f
docker remove nginx-proxy-manager -f

docker run -itd --name nginx --restart=always \
--add-host=host.docker.internal:host-gateway \
-m 512m \
-p 443:443 -p 80:80 \
ubuntu bash

docker network connect clash nginx

docker exec -it nginx bash -c "apt update && apt install -y systemctl nginx"
docker exec -it nginx bash -c "useradd nginx && apt install certbot -y"
docker cp docker/nginx-config.sh nginx:/root/