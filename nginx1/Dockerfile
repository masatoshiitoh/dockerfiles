FROM ubuntu:14.04
MAINTAINER Masato Shimizu <ma6ato@gmail.com>

RUN sed -i~ -e 's/archive.ubuntu.com/ftp.jaist.ac.jp/' /etc/apt/sources.list \
&& apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx \
&& sed -i 's/^\t\(listen \[::\]:80 .*\)$/\t#\1/' /etc/nginx/sites-available/default \
&& echo 'Hello World, Again' > /usr/share/nginx/html/index.html
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
