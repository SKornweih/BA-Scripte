FROM docker.io/debian
MAINTAINER Simon Kornweih
LABEL version="1.0"
EXPOSE 80
RUN apt-get update && apt-get upgrade -y && apt-get install apache2 -y
CMD service apache2 start && tail -f /var/log/apache2/access.log
