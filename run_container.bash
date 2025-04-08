#!/bin/bash
IFS=":"
TS_PATH=$1

[[ -d ./log ]] || mkdir ./log

docker run \
	--rm \
	--name video-transcoder \
	-v ${PWD}/log:/var/log/video-transcoder \
	-v /mnt:/mnt \
	-e TS_PATH="${TS_PATH}" \
	localhost/plex-dvr-converter:0 \
