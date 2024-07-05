#! /bin/bash

SERVER=compass-kids
CLONE='git@github.com:dJYKQXpD6E8I/compass-kids.git'
# PASSWD_DB 数据库密码
source docker-compass-kids.conf

for i in {1..3}
do
echo -e "这会删除所有 $SERVER 容器！\n按任意键继续...$i/3"
read -n 1 -s
done

docker remove $SERVER -f
docker remove $SERVER-server -f
docker remove $SERVER-database -f

docker network create $SERVER
docker run -itd --name $SERVER-server --restart=always \
-m 521m \
--network $SERVER \
-v $HOME/script:/root/script \
node:slim bash

docker exec -it $SERVER-server bash -c "apt update &&
bash /root/script/linux-mirror.sh &&
apt install ssh -y &&
ssh-keygen -t rsa"
echo -e "把这个 key 加入 https://github.com/settings/keys:\n"
docker exec -it $SERVER-server bash -c "cat ~/.ssh/id_rsa.pub"
echo -e "\n已完成？按任意键继续"
read -n 1 -s
docker exec -it $SERVER-server bash -c "apt install git -y &&
cd /root &&
git clone $CLONE &&
cd $SERVER &&
npm install &&
npm install pm2 -g &&
pm2 start vapp/server.js --watch"

docker run -d --name $SERVER-database --restart=always \
--network $SERVER \
-v $HOME/script:/root/script \
-e MYSQL_ROOT_PASSWORD=$PASSWD_DB \
mysql:8.0

sleep 5
echo "password: \"$PASSWD_DB\""
docker exec -it $SERVER-database bash -c "mysqladmin -u root -p create compass_kids &&
mysql -u root -p < /root/script/$SERVER.sql
