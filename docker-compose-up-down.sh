#!/bin/bash
cd /home/ba-admin/concourse/concourse-docker-master/
echo  "concourse up"
docker-compose up -d
cd /home/ba-admin/harbor/
echo  "harbor up"
docker-compose up -d
cd /home/ba-admin/elk/docker-elk-master/
echo  "elk down"
docker-compose down -t 1
cd /home/ba-admin/prometheus/prometheus-master/
echo  "prometheus down"
docker-compose down -t 1
