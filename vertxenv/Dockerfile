FROM ubuntu:14.04
MAINTAINER Masatoshi Itoh <masatoshi9953@gmail.com>




# Java and development environment packages.

RUN sed -i~ -e 's/archive.ubuntu.com/ftp.jaist.ac.jp/' /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y build-essential libboost-dev libboost-test-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev curl wget \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
 && add-apt-repository ppa:webupd8team/java \
 && apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get update && apt-get clean
RUN apt-get install -y oracle-java8-installer
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-set-default


# editor and others.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim git

RUN wget -O vert.x-2.1.6.tar.gz https://bintray.com/artifact/download/vertx/downloads/vert.x-2.1.6.tar.gz \
 && tar xzf vert.x-2.1.6.tar.gz


RUN apt-get update && apt-get clean

ADD vimrc /root/.vimrc

# EXPOSE 80 443
CMD [ "/bin/bash" ]

