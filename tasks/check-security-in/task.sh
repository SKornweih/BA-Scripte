#!/bin/bash
curl -ku "admin:Harbor12345" --header "Content-Type: application/json" -X POST "https://192.168.178.58/api/v2.0/projects/security-in/repositories/webserver/artifacts/latest/scan"
curl -ku "admin:Harbor12345" --header "Content-Type: application/json" -X GET "https://192.168.178.58/api/v2.0/projects/security-in/repositories/webserver/artifacts/" | jq '.[].addition_links.vulnerabilities.href' -r >> tests.txt
head -n $i tests.txt | tail -n 1
curl -ku "admin:Harbor12345" --header "Content-Type: application/json" -X GET "https://192.168.178.58/" + $1 | jq '.'
