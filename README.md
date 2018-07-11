# oanhnn/docker-laravel-echo-server

[![Build Status](https://travis-ci.org/oanhnn/docker-laravel-echo-server.svg?branch=master)](https://travis-ci.org/oanhnn/docker-laravel-echo-server)
[![](https://images.microbadger.com/badges/image/oanhnn/laravel-echo-server.svg)](https://microbadger.com/images/oanhnn/laravel-echo-server)
[![](https://images.microbadger.com/badges/version/oanhnn/laravel-echo-server.svg)](https://microbadger.com/images/oanhnn/laravel-echo-server)
[![](https://images.microbadger.com/badges/commit/oanhnn/laravel-echo-server.svg)](https://microbadger.com/images/oanhnn/laravel-echo-server)

Repository of `oanhnn/laravel-echo-server` Docker image.   
Alpine based [Laravel Echo Server](https://github.com/tlaverdure/laravel-echo-server) image.

## Features

- [x] Base from `node:10.6-alpine` image
- [x] Install `laravel-echo-server`

## Requirement
- Docker Engine 1.13+

## Usage

Make `laravel-echo-server.json` file and run

```bash
$ docker run -d -p 6001:6001 -v `pwd`:/app oanhnn/laravel-echo-server
```

If `laravel-echo-server.json` file is missing, container will generate a `laravel-echo-server.json` file from environment variable:

| Environment variable | Value if missing   | Note |
|----------------------|--------------------|------|
| `APP_URL`            | `http://127.0.0.1` | Application base URL |
| `APP_DEBUG`          | `false`            | Application debug mode |
| `LES_DB`             | `sqlite`           | Using database type of Laravel Echo Server. Allow `sqlite` or `redis` |
| `LES_HOST`           | `0.0.0.0`          | Listen host of Laravel Echo Server |
| `LES_PORT`           | `6001`             | Listen port of Laravel Echo Server |
| `REDIS_HOST`         | `127.0.0.1`        | Redis server's host |
| `REDIS_PORT`         | `6379`             | Redis server's port |
| `REDIS_DB_BACKJOBS`  | `0`                | Redis database for using |


## Contributing

All code contributions must go through a pull request and approved by a core developer before being merged. 
This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](https://github.com/oanhnn/docker-laravel-echo-server/issues).

## License

This project is released under the MIT License.   
Copyright © 2018 [Oanh Nguyen](https://github.com/oanhnn)   
Please see [License File](https://github.com/oanhnn/docker-laravel-echo-server/blob/master/LICENSE) for more information.
