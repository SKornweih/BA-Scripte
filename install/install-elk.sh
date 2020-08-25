#!/bin/bash
curl -LO https://github.com/deviantony/docker-elk/archive/master.zip
unzip master.zip
rm -rf master.zip
cd ./docker-elk-master/
docker-compose up -d
