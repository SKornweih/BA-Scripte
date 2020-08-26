#!/bin/bash
kubectl config set-credentials minikube/kubernetes --username=minikube --password=minikube
kubectl config set-cluster kubernetes  --insecure-skip-tls-verify=true --server=172.17.0.2:8443
kubectl config set-context default/kubernetes/minikube  --user=minikube/kubernetes --namespace=default --cluster=kubernetes
kubectl config use-context default/kubernetes/minikube
kubectl apply -f concourse-git/kubectl-YAML/deployment.yml

