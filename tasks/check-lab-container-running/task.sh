#!/bin/bash
rm pods-status.txt
kubectl get pods -n lab  >> pods-status.txt 
PODSTATUS=$(grep -o "1/1" pods-status.txt)
kubectl get pods -n lab
if [[ $PODSTATUS == "1/1" ]]; then
echo "Pod Status: Running..."
else
echo "Pod Status: Not Running..."
exit 1
fi
