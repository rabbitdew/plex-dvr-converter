FROM python:3.14-rc-alpine
RUN apk add ffmpeg
COPY requirements.txt /tmp
ENV PIP_ROOT_USER_ACTION=ignore
RUN pip3 install -r /tmp/requirements.txt
RUN mkdir /var/log/video-transcoder
VOLUME /var/log/video-transcoder
VOLUME /mnt
COPY video-transcoder-py3.py /opt
ENV TS_PATH=/tmp
ENTRYPOINT /opt/video-transcoder-py3.py "${TS_PATH}" 2>&1 | tee -a /var/log/video-transcoder/video-transcoder_$(date +%F).log
