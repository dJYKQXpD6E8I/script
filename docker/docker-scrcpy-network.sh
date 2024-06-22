#! /bin/bash

docker network create --subnet=172.26.0.0/16 scrcpy
docker network disconnect scrcpy scrcpy
docker network connect scrcpy --ip=172.26.0.2 scrcpy

docker network connect frps scrcpy
docker exec scrcpy adb connect frps:49565