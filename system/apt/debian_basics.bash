#!/bin/bash

# A few essential tools to get a fresh debian system equipped to download new software over secure channels

apt update
printf "Requiring root permission to install the following software:\napt-transport-https\nca-certificates\ncurl\ngnupg2\nsoftware-properties-common\ndirmngr\n"

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    dirmngr \
    unzip \
    git \
    expect \
    jq

exit 0
