#!/bin/bash

mkdir -p $HOME/.kube
cp -i concourse-git/kubectl-YAML/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
kubectl config view
kubectl apply -f concourse-git/kubectl-YAML/security-in_deployment.yml
