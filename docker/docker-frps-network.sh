#! /bin/bash

docker network create --subnet=172.23.0.0/16 frps
docker network disconnect frps frps
docker network connect frps --ip=172.23.0.2 frps