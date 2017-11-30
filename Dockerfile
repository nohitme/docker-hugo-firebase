FROM node:9.2.0-alpine

# labels
LABEL maintainer="nohitme@gmail.com"

# variables
ENV HUGO_VERSION 0.31.1

# install hugo
RUN set -x && \
  apk add --update wget ca-certificates && \
  update-ca-certificates && \
  cd /tmp &&\
  wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -O hugo.tar.gz && \
  tar xzf hugo.tar.gz && \
  mv hugo /usr/bin/hugo && \
  rm -r * && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*

# install firebase-cli
# use --unsafe-perm to solve the issue: https://github.com/firebase/firebase-tools/issues/372
RUN npm install -g firebase-tools --unsafe-perm
