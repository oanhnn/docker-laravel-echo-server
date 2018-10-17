FROM node:10-alpine

### Install Laravel Echo Server and dependencies
RUN apk add --update sqlite openssl \
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

RUN mkdir -p /app/database
COPY laravel-echo-server.json /etc/laravel-echo-server.json

COPY docker-entrypoint.sh     /usr/local/bin/docker-entrypoint
ENTRYPOINT ["docker-entrypoint"]

WORKDIR /app
VOLUME /app

EXPOSE 6001

CMD ["start"]
