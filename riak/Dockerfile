FROM centos:6
MAINTAINER Masatoshi Itoh <masatoshi9953@gmail.com>

RUN yum install -y sudo
RUN yum install -y http://yum.basho.com/gpg/basho-release-6-1.noarch.rpm
RUN yum install -y riak

RUN sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/riak/app.config
RUN echo "ulimit -n 4096" >> /etc/default/riak

EXPOSE 8087 8098
# CMD [ "yaws" ]
CMD riak start && tail -f /var/log/riak/console.log

