#!/bin/bash
curl -LO https://github.com/concourse/concourse-docker/archive/master.zip
unzip master.zip
rm -rf master.zip
cd concourse-docker-master/
./keys/generate
docker-compose up -d
wget https://github.com/concourse/concourse/releases/download/v6.5.1/fly-6.5.1-linux-amd64.tgz
tar -xzvf fly-6.5.1-linux-amd64.tgz
sudo mv fly /usr/local/bin/
rm -rf fly-6.5.1-linux-amd64.tgz
