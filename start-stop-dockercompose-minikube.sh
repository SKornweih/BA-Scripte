#!/bin/bash
cd /home/ba-admin/concourse/concourse-docker-master/
echo  "Concourse up"
docker-compose up -d
cd /home/ba-admin/harbor/
echo  "Harbor up"
docker-compose up -d
cd /home/ba-admin/elk/docker-elk-master/
echo  "ELK down"
docker-compose down -t 1
cd /home/ba-admin/prometheus/prometheus-master/
echo  "Prometheus down"
docker-compose down -t 1
minikube start --insecure-registry "192.168.178.53:80"