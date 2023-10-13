FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /home/build/src

RUN sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list \
    && sed -i s@/security.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list \
    && apt-get clean \
    && useradd -ms /bin/bash openwrt

RUN echo 'root:rocks' | chpasswd

RUN buildDeps='gcc g++ subversion build-essential libncurses5-dev zlib1g-dev gawk git ccache gettext libssl-dev xsltproc zip wget python rsync python3 screen uuid-dev' \
    && apt-get update \
    && apt-get install -y $buildDeps

USER openwrt
