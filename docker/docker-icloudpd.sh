#! /bin/bash

SERVER=icloudpd

echo -e "这会删除所有 $SERVER 容器！\n按任意键继续"
read -n 1 -s

docker remove $SERVER -f

docker network create $SERVER
docker run -d --name $SERVER --restart=always \
-m 512m \
--network $SERVER \
boredazfcuk/icloudpd
docker stop $SERVER
docker cp icloudpd.conf $SERVER:/config/
docker start $SERVER
docker exec -it $SERVER sync-icloud.sh --Initialise
docker exec $SERVER sh -c "mkdir -p /home/user/iCloud &&
touch /home/user/iCloud/.mounted"