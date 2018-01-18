#!/usr/bin/env bash

dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
v="$1"

if [ "$v" = "" ] || [ "$v" = "nginx" ]; then
    cd ${dir}/../nginx && docker build -t newtoncodes/nginx .
    cd ${dir}/../php-5.6 && docker build -t newtoncodes/nginx:php-5.6 .
    cd ${dir}/../php-7.1 && docker build -t newtoncodes/nginx:php-7.1 .
    cd ${dir}/../php-7.2 && docker build -t newtoncodes/nginx:php-7.2 .
else
    cd ${dir}/../${v} && docker build -t newtoncodes/nginx:${v} .
fi
