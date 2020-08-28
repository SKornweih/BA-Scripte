#!/bin/bash
https://github.com/concourse/concourse/releases/download/v6.5.1/fly-6.5.1-linux-amd64.tgz
tar -xzvf fly-6.5.1-linux-amd64.tgz
sudo mv fly /usr/local/bin/
rm -rf fly-6.5.1-linux-amd64.tgz
