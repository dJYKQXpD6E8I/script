#! /bin/bash

echo -e "这会删除所有 squid 容器！\n按任意键继续"
read -n 1 -s

USER='squid'
PASSWORD='17=9EHTGf:7u'
PORT=30038

docker remove squid -f
docker run --name squid -td --restart=always \
  --publish $PORT:3128 \
  --volume $HOME/docker/squid/:/var/spool/squid \
squid

apt update
apt install -y apache2-utils

echo "New password: $PASSWORD"
htpasswd -c squid_passwd $USER

docker cp squid_passwd squid:/etc/squid/
docker cp squid-simple.conf squid:/etc/squid/squid.conf
docker exec -it squid bash -c "apt update &&
apt install systemctl -y &&

apt -y install openssl &&
cd /etc/squid &&
openssl req -new > x.com.csr &&
openssl rsa -in privkey.pem -out x.com.key &&
openssl x509 -in x.com.csr -out xcom.crt -req -signkey x.com.key -days 3650 &&

systemctl enable squid &&
systemctl start squid"