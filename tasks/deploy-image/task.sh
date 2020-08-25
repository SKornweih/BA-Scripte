#!/bin/bash

kubectl config set-credentials minikube/kubernetes --username=minikube --password=minikube
kubectl config set-cluster kubernetes  --insecure-skip-tls-verify=true --server=https://172.17.0.2:8443
kubectl config set-context default/kubernetes/minikube  --user=minikube/kubernetes --namespace=default --cluster=kubernetes
kubectl config use-context default/kubernetes/minikube
kubectl create secret docker-registry harborregcred --docker-server='192.168.178.53:80' --docker-username='admin' --docker-password='Harbor12345' --docker-email='simon.kornweih@mialbox.org'
kubectl apply -f concourse-git/kubectl-YAML/deployment.yml

