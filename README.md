# oanhnn/docker-laravel-echo-server

[![Build Status](https://travis-ci.org/oanhnn/docker-laravel-echo-server.svg?branch=master)](https://travis-ci.org/oanhnn/docker-laravel-echo-server)
[![](https://images.microbadger.com/badges/image/oanhnn/laravel-echo-server.svg)](https://microbadger.com/images/oanhnn/laravel-echo-server)
[![](https://images.microbadger.com/badges/version/oanhnn/laravel-echo-server.svg)](https://microbadger.com/images/oanhnn/laravel-echo-server)
[![](https://images.microbadger.com/badges/commit/oanhnn/laravel-echo-server.svg)](https://microbadger.com/images/oanhnn/laravel-echo-server)

Repository of `oanhnn/laravel-echo-server` Docker image.   
Alpine based [Laravel Echo Server](https://github.com/tlaverdure/laravel-echo-server) image.

## Features

- [x] Base from `node:10-alpine` image
- [x] Install `laravel-echo-server`

## Requirement
- Docker Engine 1.13+

## Usage

### Run laravel-echo-server

Run laravel-echo-server by command

```bash
$ docker run -d -p 6001:6001 -v $(pwd):/app oanhnn/laravel-echo-server
```

If `/app/laravel-echo-server.json` isn't exists, default `laravel-echo-server.json` will be using, that using same default configs 
with [laravel-echo-server](https://github.com/tlaverdure/laravel-echo-server/blob/master/README.md#configurable-options)   
You can set Redis config by environment variables:

```json
  "databaseConfig": {
    "redis": {
      "host": "REDIS_HOST",
      "port": "REDIS_PORT",
      "options": {
        "db": "REDIS_DB_BACKEND"
      }
    },
    "sqlite": {}
  },
```

| Environment variable | Default value |
|:---------------------|:--------------|
| `REDIS_HOST`         | `redis`       |
| `REDIS_PORT`         | `6379`        |
| `REDIS_DB_BACKEND`   | `0`           |

### Override config by environment variables

If some environment variables are existed (allow load `/app/.env` file is found), the following options can be overridden:

| Environment variable | Config key | Note |
|:---------------------|:-----------|:-----|
| `LARAVEL_ECHO_SERVER_AUTH_HOST` | `authHost` | This option will fall back to the `LARAVEL_ECHO_SERVER_HOST` option as the default if that is set. |
| `LARAVEL_ECHO_SERVER_HOST` | `host` | |
| `LARAVEL_ECHO_SERVER_PORT` | `port` | |
| `LARAVEL_ECHO_SERVER_DEBUG` | `devMode` | |
| `LARAVEL_ECHO_SERVER_WAIT` | `true` | Wait for `/app/laravel-echo-server.json` to be injected by another process. Default is `false`. |

See more about `laravel-echo-server.json` in [here](https://github.com/tlaverdure/laravel-echo-server/blob/master/README.md)

### Run laravel-echo-server sub-commands

```bash
$ docker run --rm -it -v $(pwd):/app oanhnn/laravel-echo-server init
$ docker run --rm -it -v $(pwd):/app oanhnn/laravel-echo-server start
$ docker run --rm -it -v $(pwd):/app oanhnn/laravel-echo-server client:add
$ docker run --rm -it -v $(pwd):/app oanhnn/laravel-echo-server client:remove
```

## Contributing

All code contributions must go through a pull request and approved by a core developer before being merged. 
This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](https://github.com/oanhnn/docker-laravel-echo-server/issues).

## License

This project is released under the MIT License.   
Copyright © 2018 [Oanh Nguyen](https://github.com/oanhnn)   
Please see [License File](https://github.com/oanhnn/docker-laravel-echo-server/blob/master/LICENSE) for more information.
