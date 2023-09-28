#!/bin/sh

#Create a network
docker network create mynet

##check the network is in bridge network
docker network ls 

## create a volume
docker volume create data-vol

##then run the script ./task2.sh

#create the database mydb (need to create a name for application to look for it.)
docker run -d --name mydb \
  --network mynet \
  --mount type=volume, src=data-vol, dst=/var/lib/mysql stackupiss/northwind-app:v1

#inspect the container
docker container inspect

docker exec -ti mydb mysql -uroot -p
##enter the password

##command inside SQL Database
show databases;
use northwind;
show tables;

##Create the application named myapp
##1. expose the port (3000)
docker run -d -p 8080:3000 \
  --network mynet \
  -e DB_HOST=mydb \
  -e DB_USER=root \
  -e DB_PASSWORD=changeit \
  stackupiss/northwind-app:v1
  
## check port
docker image inspect XXXXXX

##2.
docker exec -ti 55a1 xxxxx
