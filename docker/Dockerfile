FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /home/build/src

ARG user=openwrt

RUN sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list \
    && sed -i s@/security.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list \
    && apt-get clean

ENV buildDeps='binutils bzip2 diffutils flex gcc g++ libc-dev libz-dev make subversion perl build-essential libncursesw5 libncurses5-dev \
zlib1g-dev gawk git ccache gettext libssl-dev xsltproc unzip zip wget python rsync python3 screen uuid-dev curl vim sudo'

RUN apt-get update \
    && apt-get install -y $buildDeps

RUN useradd -ms /bin/bash ${user} \
    && adduser ${user} sudo \
    && echo 'root:rocks' | chpasswd \
    && echo "${user}:rocks" | chpasswd

USER openwrt
