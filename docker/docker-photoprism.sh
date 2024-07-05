#! /bin/bash

echo -e "这会删除所有 photoprism 容器！\n按任意键继续"
read -n 1 -s

docker remove photoprism -f

source docker-photoprism.conf
docker run -d \
  --restart=always \
  --name photoprism \
  --security-opt seccomp=unconfined \
  --security-opt apparmor=unconfined \
  -e PHOTOPRISM_ADMIN_USER=$PHOTOPRISM_ADMIN_USER \
  -e PHOTOPRISM_ADMIN_PASSWORD=$PHOTOPRISM_ADMIN_PASSWORD \
  -v /photoprism/storage \
  -v $DIR:/photoprism/originals \
  photoprism/photoprism

docker-photoprism-network.sh