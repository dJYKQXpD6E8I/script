#! /bin/bash

docker network create --subnet=172.22.0.0/16 compass-kids

docker network disconnect compass-kids compass-kids-server
docker network connect compass-kids --ip=172.22.0.2 compass-kids-server

docker network connect compass-kids compass-kids-database