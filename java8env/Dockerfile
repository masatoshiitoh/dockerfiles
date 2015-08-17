FROM ubuntu:14.04
MAINTAINER Masatoshi Itoh <masatoshi9953@gmail.com>

RUN sed -i~ -e 's/archive.ubuntu.com/ftp.jaist.ac.jp/' /etc/apt/sources.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
 && add-apt-repository ppa:webupd8team/java \
 && apt-get update

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
 && apt-get update && apt-get clean \
 && apt-get install -y oracle-java8-installer \
 && apt-get install -y oracle-java8-set-default

 # && DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-set-default \

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim git

RUN  git config --global user.email "masatoshi9953@gmail.com" &&   git config --global user.name "Masatoshi Itoh" && git config --global core.editor 'vim -c "set fenc=utf-8"'

ADD vimrc /root/.vimrc

RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre" >> /root/.bashrc

RUN cd /root \
 && wget http://ftp.tsukuba.wide.ad.jp/software/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz \
 && cd /usr/local \
 && tar xzf /root/apache-maven-3.3.3-bin.tar.gz \
 && echo "export PATH=/usr/local/apache-maven-3.3.3/bin:\$PATH" >> /root/.bashrc

RUN cd /root \
 && PATH=/usr/local/apache-maven-3.3.3/bin:$PATH mvn archetype:generate -DgroupId=com.example -DartifactId=sample

ADD sample.pom.xml /root/sample/pom.xml

RUN cd /root \
 && echo "cd /root/sample; mvn install" >> /root/.bash_history \
 && echo "java -jar /root/sample/target/sample-1.0-SNAPSHOT.jar" >> /root/.bash_history

# EXPOSE 80 443
CMD [ "/bin/bash" ]

