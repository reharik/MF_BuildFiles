# Dockerfile
FROM node:4.2.1

ENV HOME /home/current
RUN mkdir -p $HOME
WORKDIR $HOME

RUN apt-get update

ADD /package.json /tmp/package.json
RUN cd /tmp && npm install && cp -a /tmp/node_modules $HOME/node_modules
RUN npm install -g mocha
RUN npm install -g babel


