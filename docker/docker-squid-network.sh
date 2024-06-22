docker network connect compass-kids squid
docker network connect frps squid
docker network connect nextcloud squid
docker network connect scrcpy squid

docker network create squid
docker network connect squid squid