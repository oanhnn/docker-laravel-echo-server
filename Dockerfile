FROM node:10.6-alpine

USER root

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

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

### Ensure www-data (ID: 82) user exists
RUN set -x \
 && addgroup -g 82 -S www-data \
 && adduser -u 82 -D -S -G www-data www-data \
 && mkdir -p /app \
 && chown -R www-data:www-data /app

COPY laravel-echo-server.tmpl /etc/laravel-echo-server.tmpl

USER www-data

WORKDIR /app

EXPOSE 6001

CMD dockerize -no-overwrite -template /etc/laravel-echo-server.tmpl:/app/laravel-echo-server.json \
        /usr/local/bin/laravel-echo-server start
