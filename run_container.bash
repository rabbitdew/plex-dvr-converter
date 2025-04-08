#!/bin/bash

[[ -d ./log ]] || mkdir ./log

docker run \
	--rm \
	--name video-transcoder \
	-v ${PWD}/log:/var/log/video-transcoder \
	-v /mnt:/mnt \
	plex-dvr-convertor:0 \
