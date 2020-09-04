#!/bin/bash
curl -sku "admin:Harbor12345" --header "Content-Type: application/json" -H "Accept: application/vnd.scanner.adapter.vuln.report.harbor+json; version=1.0" -X POST "https://192.168.178.58/api/v2.0/projects/app/repositories/webserver/artifacts/latest/scan"

echo "Start checking last Image..."

#sleep 10

VULN_PATH=$(curl -sku "admin:Harbor12345" --header "Content-Type: application/json" -H "Accept: application/vnd.scanner.adapter.vuln.report.harbor+json; version=1.0" -X GET "https://192.168.178.58/api/v2.0/projects/app/repositories/webserver/artifacts/" | jq '.[].addition_links.vulnerabilities.href' -r)
RES=$(curl -sku "admin:Harbor12345" -H "Accept: application/vnd.scanner.adapter.vuln.report.harbor+json; version=1.0" --header "Content-Type: application/json" -X GET "https://192.168.178.58$VULN_PATH")
while true; do

  if [[ $RES == "{}" || $RES == "" ]]; then
    echo "Check complete!"
    echo "Waiting for result of Image..."
    sleep 10
    curl -sku "admin:Harbor12345" -H "Accept: application/vnd.scanner.adapter.vuln.report.harbor+json; version=1.0" --header "Content-Type: application/json" -X GET "https://192.168.178.58$VULN_PATH" | jq '.' -r  >> res.txt
    severity=$(grep -a -m 1 -h -r 'severity' res.txt)
    if [[ $severity == 'severity": "Critical",' ]]; then
      echo "Image failed the Clair-Test" $severity
    rm res.txt  
    exit 1
    else
      echo "Image passed the Clair-Test" $severity
      exit 0
    fi
    echo $severity
#    RES=$(curl -sku "admin:Harbor12345" -H "Accept: application/vnd.scanner.adapter.vuln.report.harbor+json; version=1.0" --header "Content-Type: application/json" -X GET "https://192.168.178.58$VULN_PATH" ) | jq '.' -r 
  else
    echo $RES | jq '.' -r 
    exit 0
  fi

done
