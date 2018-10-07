FROM centos
MAINTAINER Masatoshi Itoh <masatoshi9953@gmail.com>

RUN yum groupinstall -y "Development tools" 
RUN yum install -y wget ncurses-devel openssl-devel autoconf
RUN wget https://github.com/erlang/otp/archive/OTP_R16B03-1.tar.gz
RUN tar xzpf OTP_R16B03-1.tar.gz && (cd otp-OTP_R16B03-1 ; ./otp_build all)

RUN cd otp-OTP_R16B03-1 ; (make && make install)

CMD [ "bash" ]

