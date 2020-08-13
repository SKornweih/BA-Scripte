#!/bin/bash
curl -LO https://github.com/vegasbrianc/prometheus/archive/master.zip
unzip master.zip
rm -rf master.zip
cd ./prometheus-master/
docker-compose up -d
