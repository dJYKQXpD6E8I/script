#! /bin/bash

echo -e "这会删除所有 clash 容器！\n按任意键继续"
read -n 1 -s

docker remove clash -f
docker run -d \
  --name clash \
  --restart=always \
  -e ENV=/root/.ashrc \
  --log-opt max-size=1m \
  laoyutang/clash-and-dashboard

docker cp clash-update.sh clash:/root/
docker exec clash sh -c 'echo "crontab -l && crond" > /root/.ashrc &&
echo "* * * * * ash /root/clash-update.sh" >> /etc/crontabs/root &&
crond -f'

bash docker-clash-network.sh