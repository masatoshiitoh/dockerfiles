FROM ubuntu:14.04
MAINTAINER Masatoshi Itoh <masatoshi9953@gmail.com>




# Java and development environment packages.

RUN sed -i~ -e 's/archive.ubuntu.com/ftp.jaist.ac.jp/' /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y build-essential libboost-dev libboost-test-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev curl wget dpkg php5-dev php5-cli phpunit erlang-base erlang-eunit erlang-dev \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
 && add-apt-repository ppa:webupd8team/java \
 && apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get update && apt-get clean
RUN apt-get install -y oracle-java8-installer
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-set-default

# automake

RUN wget http://ftp.jp.debian.org/debian/pool/main/a/automake-1.15/automake_1.15-2_all.deb
RUN dpkg -i automake_1.15-2_all.deb

# editor and others.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim git

# thrift 0.9.2
 
RUN git clone https://github.com/apache/thrift.git \
 && cd thrift \
 && ./bootstrap.sh \
 && ./configure \
 && make \
 && make install

# RUN wget -O /tmp/thrift-0.9.2.tar.gz http://www.apache.org/dyn/closer.cgi?path=/thrift/0.9.2/thrift-0.9.2.tar.gz \
#  && tar xzf /tmp/thrift-0.9.2.tar.gz \
#  && cd thrift-0.9.2/ \
#  && ./configure \
#  && make \
#  && make install


RUN apt-get update && apt-get clean

ADD vimrc /root/.vimrc

# EXPOSE 80 443
CMD [ "/bin/bash" ]

