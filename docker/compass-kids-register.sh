#! /bin/bash

FILE='compass-kids-register.xlsx'

SERVER='compass-kids'
docker cp $FILE $SERVER-server:/root/$SERVER/dashboard/custom/
docker exec -it $SERVER-server bash -c "cd ~/$SERVER &&
node dashboard/register.js"