FROM node:10.6-alpine

### Build arguments
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Laravel Echo Server Docker Image" \
      org.label-schema.description="The Docker Image for run Laravel Echo Server" \
      org.label-schema.url="https://github.com/oanhnn/docker-laravel-echo-server" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/oanhnn/docker-laravel-echo-server.git" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

### Install Laravel Echo Server and dependencies
RUN apk add --update sqlite wget openssl \
 && apk add --update --no-cache --virtual .build-deps \
        binutils-gold \
        curl \
        g++ \
        gcc \
        gnupg \
        libgcc \
        linux-headers \
        make \
        python \
 && yarn global add --prod --no-lockfile laravel-echo-server \
 && apk del .build-deps \
 && yarn cache clean

### Install Dockerize
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY laravel-echo-server.tmpl /etc/laravel-echo-server.tmpl
VOLUME /etc/laravel-echo-server.json

EXPOSE 6001

CMD dockerize -no-overwrite -template /etc/laravel-echo-server.tmpl:/etc/laravel-echo-server.json \
        /usr/local/bin/laravel-echo-server start
