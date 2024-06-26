# Automate Compile Openwrt

### This Project is for automate build openwrt image with official default config, support all arch and multi openwrt version

### Usage: ./build -t Target -v Version -p Path -r -a
```
example:
./build -t mediatek_mt7623 -v 19.07.2 -r -a
./build -t mediatek_mt7623 -v 21.02.3 -a
./build -t armvirt_32 -v 21.02.3 -a -j 48
./build -t x86_64 -v 21.02.3 -a
./build -t armsr_armv8 -v 23.05.1 -a -j 48
```
    -t Target:
        target_subtarget
        example: mediatek_mt7623 x86_64 ...

    -v Version:
        17.01.1 - 17.01.7
        18.06.0 - 18.06.9
        19.07.0 - 19.07.10
        21.02.0 - 21.02.7
        22.03.0 - 22.03.5
        23.05.0
        example: 19.07.2 21.02.3

    -p(optional) Path: new directory(absolute path), default ./openwrt_$Target_$version
    -j(optional) [N]: Allow N jobs at once; infinite jobs with no arg
    -r(optional): will rebuild, skip clone
    -a(optional): will accelerate download packages with github mirrors

### Depends: git wget docker

### docker
    docker images is openwrt_automate:v1
    docker container of every target_version is target_version
    Note: docker images and container will not be deleted automatically

### raw cmd
    git clone -b v21.02.3 --single-branch https://github.com/openwrt/openwrt.git src/
    cd src/
    sed -i 's/git.openwrt.org\/feed/github.com\/openwrt/g' feeds.conf.default
    sed -i 's/git.openwrt.org\/project/github.com\/openwrt/g' feeds.conf.default
    wget -O config.buildinfo  https://downloads.openwrt.org/releases/21.02.3/targets/mediatek/mt7623/config.buildinfo> /dev/null 2>&1
    cp config.buildinfo .config
    ./scripts/feeds update -a
    ./scripts/feeds install -a
    make -j40 V=s DOWNLOAD_MIRROR=https://raw.githubusercontent.com/calcky/openwrt_dl/21.02
