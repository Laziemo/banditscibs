#!/bin/bash

# Installs Digital Ocean Client (doctl): brings all core digital ocean admin panel functionality to your local command line. 
# With doctl you can create custom scripted tasks based on project monitoring, account balance, etc.

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./install_doctl.sh version_number \nTry 1.39.0 as version_number as of Fri, 03 Apr 2020 10:20:26 GMT\n\n\n"
 exit 1
fi

cd $HOME
curl -sL https://github.com/digitalocean/doctl/releases/download/v"$1"/doctl-"$1"-linux-amd64.tar.gz | tar -xzv && \
printf "\nRequiring root permissions to move doctl binary to /usr/local/bin\n\n"
sudo mv ~/doctl /usr/local/bin
doctl
exit 0
