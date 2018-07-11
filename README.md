# oanhnn/docker-laravel-echo-server

[![Build Status](https://travis-ci.org/oanhnn/docker-laravel-echo-server.svg?branch=master)](https://travis-ci.org/oanhnn/docker-laravel-echo-server)
[![](https://images.microbadger.com/badges/image/oanhnn/laravel-echo-server.svg)](https://microbadger.com/images/oanhnn/laravel-echo-server)
[![](https://images.microbadger.com/badges/version/oanhnn/laravel-echo-server.svg)](https://microbadger.com/images/oanhnn/laravel-echo-server)
[![](https://images.microbadger.com/badges/commit/oanhnn/laravel-echo-server.svg)](https://microbadger.com/images/oanhnn/laravel-echo-server)
[![GitHub license](https://img.shields.io/github/license/oanhnn/docker-laravel-echo-server.svg)](https://github.com/oanhnn/docker-laravel-echo-server/blob/master/LICENSE)

Repository of `oanhnn/laravel-echo-server` Docker image.   
Alpine based [Laravel Echo Server](https://github.com/tlaverdure/laravel-echo-server) image.

## Features

- [x] Base from `node:10.6-alpine` image
- [x] Install `laravel-echo-server`

## Requirement
- Docker Engine 1.13+

## Usage

Make `laravel-echo-server.json` and run

```bash
$ docker run -d -p 6001:6001 -v $(pwd):/app oanhnn/laravel-echo-server
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
