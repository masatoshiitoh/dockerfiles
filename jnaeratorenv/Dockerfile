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
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim git maven

RUN  git clone http://github.com/nativelibs4java/JNAerator.git \
 && cd JNAerator \
 && mvn clean install


RUN apt-get update && apt-get clean

RUN  git config --global user.email "masatoshi9953@gmail.com" &&   git config --global user.name "Masatoshi Itoh" && git config --global core.editor 'vim -c "set fenc=utf-8"'

ADD vimrc /root/.vimrc

# EXPOSE 80 443
CMD [ "/bin/bash" ]

