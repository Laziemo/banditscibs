#!/bin/bash -e

#INSTALL 

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./install.sh <os>  \nos must be ubuntu or debian. check about other  os.\n\n"
 exit 1
fi


OS=$1

apt-get update

curl -fsSL https://download.docker.com/linux/$OS/gpg | apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$OS \
   $(lsb_release -cs) \
   stable"

apt-get update

apt-get install -y \
 docker-ce \
 docker-ce-cli \
 containerd.io

curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/bin/docker-compose

exit 0
