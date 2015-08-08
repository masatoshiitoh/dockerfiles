FROM ubuntu:14.04
MAINTAINER Masatoshi Itoh <masatoshi9953@gmail.com>

RUN sed -i~ -e 's/archive.ubuntu.com/ftp.jaist.ac.jp/' /etc/apt/sources.list \
&& apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
&& add-apt-repository ppa:webupd8team/java \
&& apt-get update

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get update && apt-get clean
RUN apt-get install -y oracle-java8-installer

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-set-default
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim git

ADD vimrc /root/.vimrc

# EXPOSE 80 443
CMD [ "/bin/bash" ]

