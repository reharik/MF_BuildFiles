# Dockerfile for a base node installation with NVM
FROM node:0.12.7

ENV HOME /home/opt/app
RUN mkdir -p $HOME
WORKDIR $HOME

ADD /package.json /tmp/package.json
RUN cd /tmp && npm install && cp -a /tmp/node_modules $HOME/node_modules
RUN npm install -g mocha
RUN npm install -g babel
RUN npm install -g git+https://github.com/reharik/npm-install-missing.git


