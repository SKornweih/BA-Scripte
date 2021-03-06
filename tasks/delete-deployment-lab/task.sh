#!/bin/bash

echo "Setting kubeconfig..."

mkdir -p $HOME/.kube
cp -i concourse-git/kubectl-YAML/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

sleep 3

echo "kubeconfig set"
echo "Delete Deployment LAB..."

kubectl delete deployment webserver -n lab 
