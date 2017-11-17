FROM debian:latest

ENV HOME /root

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION
LABEL org.label-schema.build-date="2017-11-17T13:12:15Z" \
      org.label-schema.name="docker-pelican" \
      org.label-schema.description="Machine for maintaining a Pelican web site" \
      org.label-schema.url="https://github.com/chrisramsay/docker-pelican" \
      org.label-schema.vcs-ref="86234d65f17ee16214ae21cc3342a6ecee5f8f5b" \
      org.label-schema.vcs-url="git@github.com:chrisramsay/docker-pelican.git" \
      org.label-schema.vendor="Chris Ramsay" \
      org.label-schema.version="0.9.0" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.maintainer="Chris Ramsay <chris@ramsay-family.net>"

RUN apt-get -y update && apt-get install -y \
  build-essential \
  libssl-dev \
  libffi-dev \
  python \
  python-dev \
  python-pip \
  git

WORKDIR /srv
ADD requirements.txt /srv/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ADD files/bashrc /root/.bashrc
