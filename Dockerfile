FROM debian:latest
MAINTAINER Chris Ramsay <chris@ramsay-family.net>

ENV HOME /root

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION
LABEL org.label-schema.build-date="2017-09-06T14:04:08Z" \
      org.label-schema.name="docker-pelican" \
      org.label-schema.description="Machine for maintaining a Pelican web site" \
      org.label-schema.url="https://github.com/chrisramsay/docker-pelican" \
      org.label-schema.vcs-ref="f6f2401ee5b26e4d083669bb0e4848fac09cad88" \
      org.label-schema.vcs-url="git@github.com:chrisramsay/docker-pelican.git" \
      org.label-schema.vendor="Chris Ramsay" \
      org.label-schema.version="0.8.0" \
      org.label-schema.schema-version="1.0"

RUN apt-get -y update && apt-get install -y \
  python \
  python-dev \
  python-pip \
  git

WORKDIR /srv
ADD requirements.txt /srv/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ADD files/bashrc /root/.bashrc
