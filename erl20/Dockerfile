FROM centos
MAINTAINER Masatoshi Itoh <masatoshi9953@gmail.com>

RUN yum groupinstall -y "Development tools" 
RUN yum install -y wget ncurses-devel openssl-devel autoconf
RUN wget https://github.com/erlang/otp/archive/OTP-20.3.8.5.tar.gz
RUN tar xzpf OTP-20.3.8.5.tar.gz && (cd otp-OTP-20.3.8.5 ; ./otp_build all)

RUN cd otp-OTP-20.3.8.5 ; (make && make install)

CMD [ "bash" ]

