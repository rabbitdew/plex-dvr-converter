FROM python:3.14-rc-alpine
COPY requirements.txt /tmp
RUN pip3 install i -r /tmp/requirements.txt
COPY video-transcoder-py3.py /opt
ENTRYPOINT /opt/video-transcoder-py3.py 2>&1 | tee -a /var/log/video-transcoder/video-transcoder_$(date +%F).log
