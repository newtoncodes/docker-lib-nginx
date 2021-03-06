FROM newtoncodes/ubuntu:16.04

RUN DEBIAN_FRONTEND="noninteractive" add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y nginx
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/vhosts/default.conf /etc/nginx/vhosts/default.conf

RUN rm -rf /var/www
COPY www /var/www

COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENV THREADS=auto

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["nginx"]
