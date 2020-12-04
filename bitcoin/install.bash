#!/bin/bash

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./install.bash version_number \nTry 0.20.1 as version_number as of Tue, 19 August 2020 02:20:26 GMT\n\n\n"
 exit 1
fi

BITCOIN_VERSION=$1

set -ex \
  && for key in \
  01EA5486DE18A882D4C2684590C8019E36C2E964 \
  ; do \
  gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key" || \
  gpg --batch --keyserver pgp.mit.edu --recv-keys "$key" || \
  gpg --batch --keyserver keyserver.pgp.com --recv-keys "$key" || \
  gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
  gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" ; \
  done \
  && curl -SLO https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VERSION}/SHA256SUMS.asc \
  && curl -SLO https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz \
  && gpg --verify SHA256SUMS.asc \
  && grep "bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz\$" SHA256SUMS.asc | sha256sum -c - \
  && tar -xzf *.tar.gz -C /opt \
  && rm *.tar.gz *.asc

mv /opt/bitcoin-${BITCOIN_VERSION}/bin/* /bin/
