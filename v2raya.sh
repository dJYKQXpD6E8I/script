#! /bin/bash

wget -qO - https://apt.v2raya.org/key/public-key.asc | tee /etc/apt/keyrings/v2raya.asc
echo "deb [signed-by=/etc/apt/keyrings/v2raya.asc] https://apt.v2raya.org/ v2raya main" | tee /etc/apt/sources.list.d/v2raya.list
apt update
apt install v2raya v2ray ## 也可以使用 xray 包
systemctl start v2raya.service
systemctl enable v2raya.service
ufw allow 2017