#! /bin/bash

docker network create --subnet=172.21.0.0/16 photoprism
docker network disconnect photoprism photoprism
docker network connect photoprism --ip=172.21.0.2 photoprism