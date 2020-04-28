#!/bin/sh

docker container stop $(docker container ls -aq)
#stop previous running container

docker rm $(docker ps -a -q)
#remove stopped container

docker image rm docker-app
#remove previous image of tomcat-docker-app

docker build -t docker-app .
#build new image

docker run -p 8084:8080 -d -t docker-app
#create and run the new container
