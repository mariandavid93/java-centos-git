# Based on Centos 7 with java 8 on it
FROM nimmis/java-centos:oracle-8-jdk

ARG gitVersion=2.11.0

MAINTAINER Marian David

RUN yum groupinstall -y "Development Tools" && \
    yum install -y gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel make && \
	wget https://github.com/git/git/archive/v$gitVersion.tar.gz -O git.tar.gz && \
	tar -zxf git.tar.gz && \
	rm git.tar.gz && \
	cd git-* && \
	make configure && \
    ./configure --prefix=/usr/local && \
	make install && \
	yum autoremove -y gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel make && \
	yum clean all
	