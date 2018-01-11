# shadowsocks
#
# VERSION 0.0.3

FROM ubuntu
MAINTAINER Dariel Dato-on <oddrationale@gmail.com>

RUN apt-get update && \
    apt-get install -y python-pip libsodium18 python-m2crypto git
#RUN pip install shadowsocks
RUN pip install git+https://github.com/shadowsocks/shadowsocks.git@master
# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/ssserver"]
