#! /bin/bash

SERVER=v2ray

docker network connect frps $SERVER
docker network connect nextcloud $SERVER
docker network connect compass-kids $SERVER
docker network connect clash $SERVER
docker network connect scrcpy $SERVER