#!/usr/bin/env bash

CPU_COUNT=`grep processor /proc/cpuinfo | wc -l`;

tmp_=`basename "$(cat /proc/1/cpuset)"`
CONTAINER_ID=${tmp_:0:12}

tmp_=$(date --rfc-3339=seconds);
tmp_=${tmp_:0:19};
TIMESTAMP=$(echo $tmp_ | sed 's/[ \:\-]//g');


if [ "$1" = "nginx" ]; then
    sed -i "s/worker_processes .*/worker_processes $CPU_COUNT;/" /etc/nginx/nginx.conf

    sed -i "s#access_log /var/log/nginx/access.log#access_log /var/log/nginx/access.$TIMESTAMP-$CONTAINER_ID.log#" /etc/nginx/nginx.conf
    sed -i "s#error_log /var/log/nginx/error.log#error_log /var/log/nginx/error.$TIMESTAMP-$CONTAINER_ID.log#" /etc/nginx/nginx.conf

    if [ -f /etc/nginx/vhosts/default.conf ]; then
        sed -i "s#access_log /var/log/nginx/access.log#access_log /var/log/nginx/access.$TIMESTAMP-$CONTAINER_ID.log#" /etc/nginx/vhosts/default.conf
        sed -i "s#error_log /var/log/nginx/error.log#error_log /var/log/nginx/error.$TIMESTAMP-$CONTAINER_ID.log#" /etc/nginx/vhosts/default.conf
    fi
fi

exec "$@"
