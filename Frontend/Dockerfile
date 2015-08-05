FROM nginx

# Maintainer
MAINTAINER Raif Harik <reharik@gmail.com>

# set WORKDIR
WORKDIR /opt/app/current

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN mkdir /opt/app/current/js && mkdir /opt/app/current/css && mkdir /opt/app/current/images

COPY ./app /opt/app/current
