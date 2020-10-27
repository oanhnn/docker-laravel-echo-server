# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).



## [Unreleased] - YYYY-MM-DD

### Added
- Nothing

### Changed
- Nothing

### Deprecated
- Nothing

### Removed
- Nothing

### Fixed
- Nothing

### Security
- Nothing




## [v3.1.0] - 2020-10-27

### Changed
- Update to latest laravel-echo-server version
- Remove dangling lock file before start
- Change GitHub Workflow build, test and release




## [v3.0.0] - 2020-04-13

### Added
- Add support Redis password and prefix by `REDIS_PASSWORD` and `REDIS_PREFIX`
- Add `CHANGELOG.md`

### Changed
- Changed to build, test and publish by Github actions
- Rename some environment variables: `REDIS_DB`




## [v2.1.1] - 2019-05-07

### Add

- Add `HEALTHCHECK` block




## [v2.1.0] - 2019-01-09

### Add

- Allow wait another process generate `laravel-echo-server.json` file.

### Changed

- Changed to build and test by TravisCI, publish by Docker Auto build




## [v2.0.0] - 2018-10-17

### Changed

- Changed how to generate config file
- Changed config template file base Laravel Echo Server default config
- Changed environment variable's prefix from `LES_` to `LARAVEL_ECHO_SERVER_`
- Changed default value of same environment variables
- Changed to build and publish by TravisCI




## v1.0.0 - 2018-07-11

First release




[Unreleased]: https://github.com/oanhnn/docker-laravel-echo-server/compare/v3.1.0...develop
[v3.1.0]:      https://github.com/oanhnn/docker-laravel-echo-server/compare/v3.0.0...v3.1.0
[v3.0.0]:      https://github.com/oanhnn/docker-laravel-echo-server/compare/v2.1.1...v3.0.0
[v2.1.1]:      https://github.com/oanhnn/docker-laravel-echo-server/compare/v2.1.0...v2.1.1
[v2.1.0]:      https://github.com/oanhnn/docker-laravel-echo-server/compare/v2.0.0...v2.1.0
[v2.0.0]:      https://github.com/oanhnn/docker-laravel-echo-server/compare/v1.0.0...v2.0.0
