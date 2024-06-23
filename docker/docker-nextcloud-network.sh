#! /bin/bash

docker network create --subnet=172.20.0.0/16 nextcloud

docker network disconnect nextcloud nextcloud-server
docker network connect nextcloud --ip=172.20.0.2 nextcloud-server
docker network connect nextcloud nextcloud-database
docker network connect frps nextcloud-server