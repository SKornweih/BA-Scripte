
#!/bin/bash

kubectl config set-credentials kubernetes --username=kubernetes-admin --password=kubernetes-admin
kubectl config set-cluster kubernetes  --insecure-skip-tls-verify=true --server=https://192.168.178.53:6443
kubectl config set-context default/kubernetes  --user=kubernetes --namespace=default --cluster=kubernetes
kubectl config use-context default/kubernetes
kubectl config view
kubectl apply -f concourse-git/kubectl-YAML/deployment.yml

