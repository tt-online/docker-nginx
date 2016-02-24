#!/bin/bash

if [ -f "/var/config-nginx/nginx.conf" ]; then
    cp /var/config-nginx/nginx.conf /etc/nginx/nginx.conf
fi

if [ -d "/var/config-nginx/conf.d/" ]; then
    cp /var/config-nginx/conf.d/*  /etc/nginx/conf.d/
fi

echo "daemon off;" >> /etc/nginx/nginx.conf

/bin/bash -l -c "$*"