#!/bin/bash

echo "Setting kubeconfig..."
mkdir -p $HOME/.kube
cp -i concourse-git/kubectl-YAML/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

sleep 3

echo "Kubeconfig set"
echo "Checking Pod-Status..."

kubectl get pods -n prod  >> pods-status.txt
PODSTATUS=$(grep -o "1/1" pods-status.txt)
kubectl get pods -n prod

if [[ $PODSTATUS == "2/2" ]]; then
  echo "Pod Status: Running..."
  rm pods-status.txt
else
  echo "Pod Status: Not Running..."
  rm pods-status.txt
exit 1
fi
