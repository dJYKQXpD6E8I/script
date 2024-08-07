#! /bin/bash

docker network create --subnet=172.18.0.0/16 nextcloud

docker network disconnect nextcloud nextcloud-server
docker network disconnect nextcloud nextcloud-database
docker network disconnect nextcloud frpc

docker network connect nextcloud --ip=172.18.0.2 nextcloud-server
docker network connect nextcloud nextcloud-database
docker network connect nextcloud frpc