#! /bin/bash

echo -e "这会删除所有 clash 容器！\n按任意键继续"
read -n 1 -s

docker remove clash -f
docker run -d \
  --name clash \
  --restart=always \
  --log-opt max-size=1m \
  laoyutang/clash-and-dashboard

docker cp cron clash:/etc/crontabs/
docker exec clash sh -c "echo 'crond -f' >> /root/.rc && crond"