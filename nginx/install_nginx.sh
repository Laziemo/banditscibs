#!/bin/bash

wget https://nginx.org/download/nginx-1.10.1.tar.gz
tar -xvf nginx-1.10.1.tar.gz
cd nginx-1.10.1
./configure
make
make install

mv /usr/local/nginx /usr/bin/nginx

echo "Use nginx.example.conf @ /etc/nginx/nginx.conf"