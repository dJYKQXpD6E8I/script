#! /bin/bash

SERVER=compass-kids
CLONE='git@github.com:dJYKQXpD6E8I/compass-kids.git'
PASSWD_DB='5qjVVLN8yy7y'

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
-e http_proxy=http://clash:7890 \
-e https_proxy=http://clash:7890 \
--network $SERVER \
node:slim bash

docker network connect clash $SERVER-server

docker exec -it $SERVER-server bash -c "apt update &&
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
pm2 start vapp/server.js --watch &&
pm2 startup &&
pm2 save"

docker run -d --name $SERVER-database --restart=always \
--network $SERVER \
-e MYSQL_ROOT_PASSWORD=$PASSWD_DB \
mysql:5.7
docker cp $HOME/script/$SERVER.sql $SERVER-database:/
sleep 5
echo "password: \"$PASSWD_DB\""
docker exec -it $SERVER-database bash -c "mysqladmin -u root -p create compass_kids &&
mysql -u root -p compass_kids <  $SERVER.sql"
