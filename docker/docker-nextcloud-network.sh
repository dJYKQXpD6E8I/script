#! /bin/bash

docker network create --subnet=172.20.0.0/16 nextcloud

docker network disconnect nextcloud nextcloud-server
docker network connect nextcloud --ip=172.20.0.1 nextcloud-server
docker network connect nextcloud nextcloud-database