#!/bin/bash
IMAGE_NAME=$1 # Parameter 1                                                                                                                                                                                        
IMAGE_TAG=${2:-latest} # Parameter 2 (if set, else use default: 'latest')                                                                                                                                                                                                                 echo "Building Image $IMAGE_NAME with tag $IMAGE_TAG"
echo "Building Image $IMAGE_NAME with tag $IMAGE_TAG"
docker build -t 192.168.178.53:80/bachelor2020/$IMAGE_NAME:$IMAGE_TAG .
sudo docker login 192.168.178.53:80
docker tag $IMAGE_NAME 192.168.178.53:80/bachelor2020/$IMAGE_NAME:$IMAGE_TAG
docker push 192.168.178.53:80/bachelor2020/$IMAGE_NAME:$IMAGE_TAG
echo "---
apiVersion: v1
kind: Namespace
metadata:
  name: $IMAGE_NAME
  labels:
    name: $IMAGE_NAME
" >> $IMAGE_NAME-ns.yml
kubectl apply -f $IMAGE_NAME-ns.yml
