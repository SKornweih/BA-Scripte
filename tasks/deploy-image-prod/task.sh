#!/bin/bash
echo "Setting kubeconfig..."
mkdir -p $HOME/.kube
cp -i concourse-git/kubectl-YAML/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

sleep 3

echo "Kubeconfig set"
echo "Apply PROD-Deployment with:"
cat concourse-git/kubectl-YAML/prod-deployment.yml
kubectl apply -f concourse-git/kubectl-YAML/prod-deployment.yml

echo "PROD-Deployment applyed"
sleep 10
kubectl get deployment -n  prod
