#! /bin/bash

echo -e "这会删除所有 frps 容器！\n按任意键继续"
read -n 1 -s

docker remove frps -f

docker network create frps
docker run -itd --name frps --restart=always \
-p 55363:7000 \
--network=frps \
-m 512m \
ubuntu bash

docker exec -it frps bash -c "apt update &&
apt install -y wget systemctl vim &&
wget https://github.ioiox.com/stilleshan/frps/raw/branch/master/frps_linux_install.sh &&
chmod +x frps_linux_install.sh &&
./frps_linux_install.sh &&
vim /usr/local/frp/frps.toml &&
# 修改 frps.toml 配置
systemctl restart frps
# 重启 frps 服务即可生效
"