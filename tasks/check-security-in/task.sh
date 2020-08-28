#!/bin/bash
curl -ku "admin:Harbor12345" --header "Content-Type: application/json" -X POST "https://192.168.178.58/api/v2.0/projects/security-in/repositories/webserver/artifacts/latest/scan"
