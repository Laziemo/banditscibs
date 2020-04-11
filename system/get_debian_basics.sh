#!/bin/bash

# A few essential tools to get a fresh debian system equipped to download new software over secure channels

sudo apt update
printf "Requiring root permission to install the following software:\napt-transport-https\nca-certificates\ncurl\ngnupg2\nsoftware-properties-common\ndirmngr\n"

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    dirmngr

exit 0
