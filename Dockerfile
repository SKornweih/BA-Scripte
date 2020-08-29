FROM docker.io/debian
MAINTAINER Simon Kornweih
LABEL version="1.0"
EXPOSE 80
RUN apt-get update && apt-get upgrade -y && apt-get install apache2 curl apt-utils jq -y
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN kubectl version --client
RUN mkdir -p $HOME/.kube
COPY /etc/kubernetes/admin.conf $HOME/.kube/config
RUN chown $(id -u):$(id -g) $HOME/.kube/config
CMD service apache2 start && tail -f /var/log/apache2/access.log
