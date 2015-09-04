# DOCKER-VERSION 0.3.4
FROM    centos:6

# ここは自由に変えてください
MAINTAINER Masatoshi Itoh

# Ansibleのnovelsphere定義を参考にしたパッケージインストール

ADD remi.repo /etc/yum.repos.d/remi.repo
ADD epel-testing.repo /etc/yum.repos.d/epel-testing.repo
ADD epel.repo /etc/yum.repos.d/epel.repo
ADD RPM-GPG-KEY-remi /etc/pki/rpm-gpg/RPM-GPG-KEY-remi
ADD RPM-GPG-KEY-EPEL-6 /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
ADD netrc /root/.netrc

RUN yum -y update \
 && yum -y --enablerepo=remi-php56,remi,epel install curl wget vim git openssh-server sudo

RUN yum clean all

# ここからsupervisord (1つのコンテナで複数のサービスを動かす）

RUN wget http://peak.telecommunity.com/dist/ez_setup.py;python ez_setup.py;easy_install distribute;
RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py;python get-pip.py;
RUN pip install --upgrade supervisor supervisor-stdout 

RUN echo 'root:root' | chpasswd

ADD supervisord.sh /etc/init.d/supervisord
RUN chmod 755 /etc/init.d/supervisord
ADD supervisord.conf /etc/supervisord.conf

RUN sed -i '/pam_loginuid\.so/s/required/optional/' /etc/pam.d/sshd

RUN cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig \
 && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
 && sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config \
 && sed -ri 's/#PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config \
 && sed -ri 's/#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config \
 && sed -ri 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config \
 && sed -ri 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

RUN service sshd start
RUN service sshd stop

EXPOSE 22
CMD ["/usr/bin/supervisord"]
#CMD ["/bin/bash"]
