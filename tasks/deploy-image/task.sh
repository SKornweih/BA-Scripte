#!/bin/bash

mkdir -p $HOME/.kube
sudo cp -i concourse-git/kubectl-YAML/admin.conf $HOME/.kube/config -y
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl config view
kubectl apply -f concourse-git/kubectl-YAML/deployment.yml
