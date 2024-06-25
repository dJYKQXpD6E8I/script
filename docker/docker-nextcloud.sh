#! /bin/bash

PORT=36764
PORT_DB=28869
PASSWD_DB='FZDee8rbGp5d'

echo -e "这会删除所有 nextcloud 容器！\n按任意键继续"
read -n 1 -s

docker remove nextcloud -f
docker remove nextcloud-server -f
docker remove nextcloud-aio-mastercontainer -f
docker remove nextcloud-database -f

docker run --name nextcloud-server -d --restart=always \
-v /mnt:/home/www/disk \
-m 512m \
nextcloud

docker run --name nextcloud-database -d --restart=always \
-e MYSQL_ROOT_PASSWORD=$PASSWD_DB \
mysql:8.0

sleep 5
echo "enter password: \"$PASSWD_DB\""
docker exec -it nextcloud-database bash -c "mysqladmin -u root -p create nextcloud"