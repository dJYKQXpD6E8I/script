#! /bin/bash

docker network create --subnet=172.18.0.0/16 clash
docker network disconnect clash clash
docker network connect clash --ip=172.18.0.2 clash