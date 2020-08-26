#!/bin/bash
kubectl config set-credentials minikube--username=minikube --password=minikube
kubectl config set-cluster minikube  --insecure-skip-tls-verify=true --server=172.17.0.2:8443
kubectl config set-context default/minikube  --user=minikube --namespace=default --cluster=minikube
kubectl config use-context default/minikube
kubectl config view
kubectl apply -f concourse-git/kubectl-YAML/deployment.yml

