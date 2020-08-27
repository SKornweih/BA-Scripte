#!/bin/bash
sudo docker login 192.168.178.53:80
docker tag webserver 192.168.178.53:80/bachelor2020/webserver:latest
docker push 192.168.178.53:80/bachelor2020/
