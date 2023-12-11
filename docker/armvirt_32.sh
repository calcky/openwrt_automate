#!/bin/bash
set -x
git clone -b v21.02.3 --single-branch https://github.com/openwrt/openwrt.git src
cd src/
sed -i 's/git.openwrt.org\/feed/github.com\/openwrt/g' feeds.conf.default
sed -i 's/git.openwrt.org\/project/github.com\/openwrt/g' feeds.conf.default
wget -O config.buildinfo  https://downloads.openwrt.org/releases/21.02.3/targets/armvirt/32/config.buildinfo> /dev/null 2>&1
cp config.buildinfo .config