#! /bin/bash

echo -e "这会删除所有 photoprism 容器！\n按任意键继续"
read -n 1 -s

docker remove photoprism -f

docker run -d \
  --restart=always \
  --name photoprism \
  --security-opt seccomp=unconfined \
  --security-opt apparmor=unconfined \
  -e PHOTOPRISM_ADMIN_USER="4eX6Y8qfk18M" \
  -e PHOTOPRISM_ADMIN_PASSWORD="66h!#^>JyWn<" \
  -v /photoprism/storage \
  -v /mnt/e/照片:/photoprism/originals \
  photoprism/photoprism