#! /bin/bash

proxies='v2ray clash squid frpc'
servers='frps nextcloud compass-kids scrcpy clash photoprism'

for proxy in $proxies
do

for server in $servers
do
docker network connect $server $proxy
done

done