FROM ubuntu:14.04
MAINTAINER Masatoshi Itoh <masatoshi9953@gmail.com>

RUN sed -i~ -e 's/archive.ubuntu.com/ftp.jaist.ac.jp/' /etc/apt/sources.list \
&& apt-get update && apt-get clean

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential g++ zlib1g-dev libc6-dev-i386
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim git

RUN  git config --global user.email "masatoshi9953@gmail.com" &&   git config --global user.name "Masatoshi Itoh" && git config --global core.editor 'vim -c "set fenc=utf-8"'

ADD vimrc /root/.vimrc

# EXPOSE 80 443
CMD [ "/bin/bash" ]

