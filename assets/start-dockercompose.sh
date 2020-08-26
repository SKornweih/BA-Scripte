#!/bin/bash
cd /home/ba-admin/concourse/concourse-docker-master/
echo  "Concourse up"
docker-compose up -d
cd /home/ba-admin/harbor/
echo  "Harbor up"
docker-compose up -d

