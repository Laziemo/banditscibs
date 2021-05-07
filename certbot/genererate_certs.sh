#!/bin/bash

# Generate free, CA signed SSL Certificates
# Buy a domain name at namecheap.com
# Secure your domain name with cloudflare.com

# Testing signed commits

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments. Missing url.\nusage:\n./generate_ssl_certs.sh <url-eg: mon.sats.cc> \nRegister and host a domain name (with namecheap/cloudflare) to resolve to this server's IP: use system/network/get_ip.sh to get your IP address\n\n\n"
 exit 1
fi

URL=$1

sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt

sudo mkdir /etc/letsencrypt/live

cd /opt/letsencrypt

echo "Creating certificates for $URL"

sudo -H ./letsencrypt-auto certonly --standalone -d $URL

echo "The following sites have authorized letsencrypt ssl certificates"
sudo ls /etc/letsencrypt/live

exit 0;
