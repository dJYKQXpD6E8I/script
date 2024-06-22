#! /bin/bash

docker network create --subnet=172.31.0.0/16 squid
docker network disconnect squid squid
docker network connect squid --ip=172.31.0.2 squid