#!/usr/bin/env bash

dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
v="$1"

if [ "$v" = "" ] || [ "$v" = "nginx" ]; then
    cd ${dir}/../nginx && docker build -t newtoncodes/nginx .
#else
#    cd ${dir}/../${v} && docker build -t newtoncodes/nginx:${v} .
fi
