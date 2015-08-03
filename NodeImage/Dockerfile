# Dockerfile for a base node installation with NVM
FROM debian:wheezy

USER root

RUN \
  mkdir -p /opt/app/current && \
  mkdir -p /var/log/nodejs && \
  mkdir -p /var/run/nodejs && \
  echo DIRECTORIES BUILT && \
  echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list && \
  echo ADDING APT BACKPORTS SOURCES REF && \
  apt-get update && \
  echo APT-GET UPDATED && \
  apt-get -yqt wheezy-backports install curl gnupg git python build-essential && \
  echo APT-GET PACKAGES INSTALLED && \
  apt-get clean && \
  echo APT-GET CLEANED && \
  curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
  apt-get -y install nodejs && \
  echo NODE INSTALLED && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  echo REMOVED TEMPORARY FILES 
ADD /package.json /tmp/package.json
RUN cd /tmp && npm install && cp -a /tmp/node_modules /opt/app/current/node_modules
RUN npm install -g babel

 # curl https://raw.githubusercontent.com/creationix/nvm/v0.25.1/install.sh | bash && \
 # echo NVM INSTALLED
