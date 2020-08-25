#!/bin/bash
kubectl config --kubeconfig=concourse-git/kubectl-YAML/config
kubectl create secret docker-registry harborregcred --docker-server='192.168.178.53:80' --docker-username='admin' --docker-password='Harbor12345' --docker-email='simon.kornweih@mialbox.org'
kubectl apply -f concourse-git/kubectl-YAML/deployment.yml

