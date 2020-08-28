#!/bin/bash
curl -sku "admin:Harbor12345" --header "Content-Type: application/json" -H "Accept: application/vnd.scanner.adapter.vuln.report.harbor+json; version=1.0" -X POST "https://192.168.178.58/api/v2.0/projects/security-in/repositories/webserver/artifacts/latest/scan"
#sleep 10
VULN_PATH=$(curl -sku "admin:Harbor12345" --header "Content-Type: application/json" -H "Accept: application/vnd.scanner.adapter.vuln.report.harbor+json; version=1.0" -X GET "https://192.168.178.58/api/v2.0/projects/security-in/repositories/webserver/artifacts/" | jq '.[].addition_links.vulnerabilities.href' -r)
RES=$(curl -sku "admin:Harbor12345" -H "Accept: application/vnd.scanner.adapter.vuln.report.harbor+json; version=1.0" --header "Content-Type: application/json" -X GET "https://192.168.178.58$VULN_PATH")
while true; do

  if [[ $RES == "{}" || $RES == "" ]]; then
    echo "Waiting for result..."
    sleep 10
    RES=$(curl -sku "admin:Harbor12345" -H "Accept: application/vnd.scanner.adapter.vuln.report.harbor+json; version=1.0" --header "Content-Type: application/json" -X GET "https://192.168.178.58$VULN_PATH")
  else
    echo $RES | jq '.'
    exit 0
  fi

done
