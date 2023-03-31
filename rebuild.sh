#!/bin/sh

# pass -d to this script to restart the container in the background

docker stop "krishna.video"
docker rm "krishna.video"
docker rmi "tripodvideoninja-app"
docker-compose up $@
