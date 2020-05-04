#!/bin/bash -e

#INSTALL 

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./install.sh <os>  \nos must be ubuntu or debian. check about other  os.\n\n"
 exit 1
fi


OS=$1

apt update

curl -fsSL https://download.docker.com/linux/$OS/gpg | apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$OS \
   $(lsb_release -cs) \
   stable"

apt update

apt install docker-ce docker-ce-cli containerd.io


exit 0
