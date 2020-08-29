#!/bin/bash
echo "Setting kubeconfig..."
mkdir -p $HOME/.kube
cp -i concourse-git/kubectl-YAML/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
sleep 3
echo "Kubeconfig set"
echo "Apply security-in_deployment with:"
cat concourse-git/kubectl-YAML/lab-deployment.yml
kubectl apply -f concourse-git/kubectl-YAML/lab-deployment.yml
echo "security-in_deployment applyed"
sleep 10
kubectl get deployment -n  lab
