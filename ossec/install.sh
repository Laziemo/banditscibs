#!/bin/bash -e

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./install.sh ossec_version \nTry 3.6.0 as of Wednesday, 22 April 2020\n\n"
 exit 1
fi

VERSION="$1"

wget https://www.atomicorp.com/OSSEC-ARCHIVE-KEY.asc
gpg --import OSSEC-ARCHIVE-KEY.asc

wget https://github.com/ossec/ossec-hids/releases/download/$VERSION/ossec-hids-$VERSION.tar.gz.asc
wget https://github.com/ossec/ossec-hids/archive/$VERSION.tar.gz
gpg --verify ossec-hids-$VERSION.tar.gz.asc $VERSION.tar.gz

rm -rf ossec-hids-$VERSION.tar.gz.asc

tar -xvf $VERSION.tar.gz && \
rm -rf $VERSION.tar.gz


cd ossec-hids-$VERSION && \
./install.sh

exit 0
