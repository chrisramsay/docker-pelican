FROM debian:latest

ENV HOME /root

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION
LABEL org.label-schema.build-date="2017-11-17T13:07:02Z" \
      org.label-schema.name="docker-pelican" \
      org.label-schema.description="Machine for maintaining a Pelican web site" \
      org.label-schema.url="https://github.com/chrisramsay/docker-pelican" \
      org.label-schema.vcs-ref="f060f635e6cd4f3e1171e071fcbe74798b202483" \
      org.label-schema.vcs-url="git@github.com:chrisramsay/docker-pelican.git" \
      org.label-schema.vendor="Chris Ramsay" \
      org.label-schema.version="1.0.0" \
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
