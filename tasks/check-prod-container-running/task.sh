#!/bin/bash

echo "Setting kubeconfig..."
mkdir -p $HOME/.kube
cp -i concourse-git/kubectl-YAML/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

sleep 3

echo "Kubeconfig set"
echo "Checking Deployment-Status..."

kubectl get deployment -n prod  >> deployment-status.txt

PODSTATUS=$(grep -o "2/2" deployment-status.txt)

kubectl get pods -n prod

if [[ $PODSTATUS == "2/2" ]]; then
  echo "Deployment Status: 2/2."
  rm deployment-status.txt
else
  echo "Deployment Status: 0/2"
  rm deployment-status.txt
exit 1
fi
