#! /bin/bash

docker network disconnect compass-kids compass-kids-server
docker network connect compass-kids compass-kids-server

docker network disconnect compass-kids compass-kids-database
docker network connect compass-kids compass-kids-database