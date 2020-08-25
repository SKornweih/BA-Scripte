#!/bin/bash
curl -LO https://github.com/concourse/concourse-docker/archive/master.zip
unzip master.zip
rm -rf master.zip
cd concourse-docker-master/
./keys/generate
docker-compose up -d
