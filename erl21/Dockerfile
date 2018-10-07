FROM centos
MAINTAINER Masatoshi Itoh <masatoshi9953@gmail.com>

RUN yum groupinstall -y "Development tools" 
RUN yum install -y wget ncurses-devel openssl-devel autoconf
RUN wget https://github.com/erlang/otp/archive/OTP-21.1.tar.gz
RUN tar xzpf OTP-21.1.tar.gz && (cd otp-OTP-21.1 ; ./otp_build all)

RUN cd otp-OTP-21.1 ; (make && make install)

CMD [ "bash" ]

