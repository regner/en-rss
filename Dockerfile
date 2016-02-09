

FROM debian:latest
MAINTAINER Regner Blok-Andersen <shadowdf@gmail.com>

RUN apt-get update -qq
RUN apt-get upgrade -y -qq
RUN apt-get install -y -qq python-dev python-pip
RUN pip install -qU pip

ENV GOOGLE_APPLICATION_CREDENTIALS "path-to-credentials.json"
ENV GCLOUD_DATASET_ID "your gce project"

ADD en_rss.py /en_rss/
ADD requirements.txt /en_rss/

WORKDIR /en_rss/

RUN pip install -r requirements.txt

CMD python /en_rss/en_rss.py
