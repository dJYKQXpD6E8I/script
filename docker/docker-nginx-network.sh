#! /bin/bash

docker network connect nginx nginx
docker network connect frps nginx
docker network connect nextcloud nginx
docker network connect compass-kids nginx
docker network connect clash nginx
docker network connect scrcpy nginx
docker network connect v2ray nginx