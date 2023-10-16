# Automate Compile Openwrt

### This Project is for automate build openwrt image with official default config, support all arch and multi openwrt version

### Usage: ./build -t Target -v Version -p Path -r -a
example: ./build -t mediatek_mt7623 -v 19.07.2 -a
         ./build -t x86_64 -v 19.07.2 -a

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

    -p(optional) Path: new directory(absolute path), default ./openwrt_subtarget_version
    -r(optional): will rebuild, skip clone
    -a(optional): will accelerate download packages with github mirrors

### Depends: git wget docker

### docker
    docker images is openwrt_automate:v1
    docker container of every target_version is target_version
    Note: docker images and container will not be deleted automatically