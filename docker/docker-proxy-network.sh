#! /bin/bash

proxies='nginx v2ray clash squid'
servers='frps nextcloud compass-kids scrcpy'

for proxy in $proxies
do

for server in $servers
do
docker network connect $server $proxy
done

done