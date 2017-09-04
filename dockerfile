LABEL maintainer="nohitme@gmail.com"

FROM node:8.4.0-alpine

# variables
ENV HUGO_VERSION 0.26

# install hugo
RUN set -x && \
  apk add --update wget ca-certificates && \
  cd /tmp &&\
  wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -O hugo.tar.gz && \
  tar xzf hugo.tar.gz && \
  mv hugo /usr/bin/hugo && \
  rm -r * && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*

# install firebase-cli
RUN npm install -g firebase-tools
