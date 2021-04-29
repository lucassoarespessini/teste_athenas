#!/bin/bash
set -x #echo on
sudo docker rm $(docker ps -aq)
sudo docker rmi $(docker images -q)
sudo docker system prune -a
sudo docker-compose ps
sudo docker-compose rm -f
sudo docker-compose down
sudo docker-compose up --force-recreate -d
sudo docker-compose build --no-cache
sudo docker-compose pull