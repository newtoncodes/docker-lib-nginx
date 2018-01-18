#!/usr/bin/env bash

v="$1"

if [ "$v" = "" ] || [ "$v" = "nginx" ]; then
    docker push newtoncodes/nginx
    docker push newtoncodes/nginx:php-5.6
    docker push newtoncodes/nginx:php-7.1
    docker push newtoncodes/nginx:php-7.2
else
    docker push newtoncodes/nginx:${v}
fi
