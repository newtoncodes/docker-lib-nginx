#!/usr/bin/env bash

v="$1"

if [ "$v" = "" ] || [ "$v" = "nginx" ]; then
    docker push newtoncodes/nginx
else
    docker push newtoncodes/nginx:${v}
fi
