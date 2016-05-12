## FILE: Dockerfile
FROM ubuntu:16.04
MAINTAINER ForDoDone <fordodone@gmail.com>

RUN apt-get update && \
    apt-get install -y automake autotools-dev g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config vim

RUN cd /usr/src && \
    git clone https://github.com/s3fs-fuse/s3fs-fuse.git 

RUN cd /usr/src/s3fs-fuse && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

COPY credentials /root/.s3fs

RUN chmod 600 /root/.s3fs && \
    mkdir -p /mnt/s3fs

RUN echo 'function s3mount(){ mkdir -p /mnt/s3fs/$1 && s3fs $1 /mnt/s3fs/$1 -o passwd_file=/root/.s3fs ; }' >> /root/.bashrc

RUN echo 's3mount $BUCKET' >> /root/.bashrc

CMD /bin/bash

