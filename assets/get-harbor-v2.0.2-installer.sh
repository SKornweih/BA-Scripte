#!/bin/bash
curl -LO https://github.com/goharbor/harbor/releases/download/v2.0.2/harbor-online-installer-v2.0.2.tgz
tar xvf harbor-online-installer-v2.0.2.tgz
openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 -subj "/C=CN/ST=Peine/L=Peine/O=example/OU=Personal/CN=debian-host" -key ca.key -out ca.crt
openssl genrsa -out debian-host.key 4096
openssl req -sha512 -new -subj "/C=CN/ST=Peine/L=Peine/O=example/OU=Personal/CN=debian-host" -key debian-host.key -out debian-host.csr
cat > v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS.1=debian-host
DNS.2=debian-host
DNS.3=debian-host
EOF
openssl x509 -req -sha512 -days 3650 -extfile v3.ext -CA ca.crt -CAkey ca.key -CAcreateserial -in debian-host.csr -out debian-host.crt
mkdir /data/cert
cp debian-host.crt /data/cert/
cp debian-host.key /data/cert/
openssl x509 -inform PEM -in debian-host.crt -out debian-host.com.cert
mkdir /etc/docker/certs.d/debian-host
cp debian-host.cert /etc/docker/certs.d/debian-host/
cp debian-host.key /etc/docker/certs.d/debian-host/
cp ca.crt /etc/docker/certs.d/debian-host/
systemctl restart docker
