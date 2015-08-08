FROM ubuntu:14.04
MAINTAINER Masatoshi Itoh <masatoshi9953@gmail.com>

RUN sed -i~ -e 's/archive.ubuntu.com/ftp.jaist.ac.jp/' /etc/apt/sources.list \
&& apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y yaws \
&& sed -i 's/YAWS_ID=debian_yaws/YAWS_ID=docker_yaws/' /etc/default/yaws \
&& sed -i 's/8080/80/' /etc/yaws/conf.d/localhost.conf \
&& sed -i 's/8443/443/' /etc/yaws/conf.d/localhost-ssl.conf \
&& echo 'Hello World from yaws' > /usr/share/yaws/index.html
EXPOSE 80 443
CMD [ "yaws" ]
