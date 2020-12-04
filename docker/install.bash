#!/bin/bash -e

# Install docker on debian


apt-get update
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs)  stable"

apt-get update

apt-get install -y \
 docker-ce \
 docker-ce-cli \
 containerd.io

curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose

chmod +x /usr/bin/docker-compose
usermod -aG docker $USER
exit 0
