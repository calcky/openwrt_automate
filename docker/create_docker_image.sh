#!/bin/bash
set -e

source .conf

docker image rm -f $IMAGE_NAME:$TAG
#docker image prune -f

# build docker image
docker build -t $IMAGE_NAME:$TAG .