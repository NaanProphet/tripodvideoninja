#!/bin/sh

# exit on first error
set -e

docker stop "krishna.video"
docker rm "krishna.video"
docker rmi "tripodvideoninja-app"
docker-compose up -d
