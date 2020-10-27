FROM node:lts-alpine

WORKDIR /app

### Install Laravel Echo Server and dependencies
RUN set -eux; \
    apk add --update --no-cache \
        sqlite \
        openssl \
        curl \
    ; \
    apk add --update --no-cache --virtual .build-deps \
        build-base \
    ; \
    yarn global add --prod --no-lockfile laravel-echo-server ; \
    apk del .build-deps ; \
    yarn cache clean ; \
    mkdir -p /app/database ; \
    rm /usr/local/bin/docker-entrypoint.sh

COPY bin/* /usr/local/bin/
COPY src/laravel-echo-server.json /usr/local/src/

VOLUME /app
EXPOSE 6001

ENTRYPOINT ["docker-entrypoint"]
CMD ["start"]
