FROM docker.io/debian
MAINTAINER Simon Kornweih
LABEL version="1.0"
EXPOSE 80
RUN apt-get update && apt-get upgrade -y && apt-get install apache2 curl apt-utils -y
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh
RUN docker version
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN kubectl version --client
RUN curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube
RUN mkdir -p /usr/local/bin/
RUN install minikube /usr/local/bin/
RUN minikube start --insecure-registry "192.168.178.53:80"
CMD service apache2 start && tail -f /var/log/apache2/access.log
