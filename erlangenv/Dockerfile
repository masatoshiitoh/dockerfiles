FROM ubuntu:14.04
MAINTAINER Masatoshi Itoh <masatoshi9953@gmail.com>




# Java and development environment packages.

RUN sed -i~ -e 's/archive.ubuntu.com/ftp.jaist.ac.jp/' /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y build-essential libssl-dev curl wget erlang-base erlang-eunit erlang-dev vim git \
 && apt-get clean

ADD vimrc /root/.vimrc

# EXPOSE 80 443
CMD [ "/bin/bash" ]

