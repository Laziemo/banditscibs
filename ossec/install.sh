#!/bin/bash -e


if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./install.sh ossec_version \nTry 3.6.0 as of Wednesday, 22 April 2020\n\n"
 exit 1
fi

VERSION=$1
export PCRE2_SYSTEM=yes

apt-get update 
apt-get install -y \
 gcc \
 libevent-dev libpcre2-dev zlib1g-dev libssl-dev \
 php php-cli php-common \
 libapache2-mod-php apache2-utils \
 sendmail \
 inotify-tools \

wget https://www.atomicorp.com/OSSEC-ARCHIVE-KEY.asc
gpg --import OSSEC-ARCHIVE-KEY.asc

wget https://github.com/ossec/ossec-hids/releases/download/$VERSION/ossec-hids-$VERSION.tar.gz.asc
wget https://github.com/ossec/ossec-hids/archive/$VERSION.tar.gz

gpg --verify ossec-hids-$VERSION.tar.gz.asc $VERSION.tar.gz && \
rm -rf ossec-hids-$VERSION.tar.gz.asc OSSEC-ARCHIVE-KEY.asc

tar -xvf $VERSION.tar.gz && \
rm -rf $VERSION.tar.gz

cd ossec-hids-$VERSION && \
./install.sh

exit 0
