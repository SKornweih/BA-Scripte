#!/bin/bash
echo Imagename eingeben:
read name
docker build -t $name /home/ba-admin/dockerfile/
sudo docker login 192.168.178.53
echo Imagetag eingeben:
read tag
docker tag $name 192.168.178.53/bachelor2020/$name:$tag
