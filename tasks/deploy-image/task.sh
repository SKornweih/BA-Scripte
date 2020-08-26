#!/bin/bash
kubectl config set-credentials minikube/kubernetes --username=minikube --password=minikube
kubectl config set-cluster kubernetes  --insecure-skip-tls-verify=true --server=192.168.178.53
kubectl config set-context default/kubernetes/minikube  --user=minikube/kubernetes --namespace=default --cluster=kubernetes
kubectl config use-context default/kubernetes/minikube
kubectl apply -f concourse-git/kubectl-YAML/deployment.yml

