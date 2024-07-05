#! /bin/ash

# URL 订阅地址
source clash-update.conf

wget $URL -O /root/.config/clash/config.yaml &&
kill $(netstat -tunlp|grep -m 1 -oE '\d+/clash'|grep -oE '\d+')