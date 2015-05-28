FROM       ubuntu:latest
MAINTAINER Docker

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list 

RUN apt-get update && apt-get install -y mongodb-org

EXPOSE 27017

CMD ["/usr/bin/mongod", "--dbpath", "/data/mongo/db"]

