#!/bin/bash
IMAGE_NAME=$1 # Parameter 1                                                                                                                                                                                                               
IMAGE_TAG=$2 # Parameter 2                                                                                                                                                                                                                 echo "Building Image $IMAGE_NAME with tag $IMAGE_TAG"
docker build -t $1 /home/ba-admin/dockerfile/
sudo docker login 192.168.178.53
docker tag $1 192.168.178.53/bachelor2020/$1:$2
docker push 192.168.178.53/bachelor2020/$1:$2
