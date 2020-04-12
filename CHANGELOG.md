# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).



## [Unreleased] - YYYY-MM-DD

### Added
- Add support Laravel 6.5

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




## [1.0.2] - 2019-11-06

### Added
- Support `monolog/monolog:^2.0`

### Changed
- Change coding style from PSR-2 to PSR-12

### Fixed
- Logs wasn't send to Logz.io




## [1.0.1] - 2019-11-06

### Fixed
- Fix class name `ServiceProvider` in `composer.json`. Thank @cschalenborgh




## [1.0.0] - 2019-11-05

### Added
- Add support PHP application (non Laravel)
- Add support `region`, thank @cschalenborgh

### Changed
- Using `GuzzleHttp/Guzzle` package instead of `ext-curl`
- Rename class `Laravel\Logzio\LogzioFormatter` to `Laravel\Logzio\Log\Formatter`
- Rename class `Laravel\Logzio\LogzioHandler` to `Laravel\Logzio\Log\Handler`
- Refactor test scripts




## [0.2.0] - 2019-09-07

### Changed
- Update support for Laravel Framework v6.0
- Update TravisCI configuration
- Update PHPUnit configuration




## [0.1.2] - 2018-07-18

### Fixed
- Missing class `Laravel\Logzio\LogzioServiceProvider`




## [0.1.1] - 2018-05-18

### Changed
- Changed CHANGELOG format

### Fixed
- Fix project link




## 0.1.0 - 2018-04-17

First release



[Unreleased]: https://github.com/oanhnn/laravel-logzio/compare/v1.0.2...develop
[1.0.2]:      https://github.com/oanhnn/laravel-logzio/compare/v1.0.1...v1.0.2
[1.0.1]:      https://github.com/oanhnn/laravel-logzio/compare/v1.0.0...v1.0.1
[1.0.0]:      https://github.com/oanhnn/laravel-logzio/compare/v0.2.0...v1.0.0
[0.2.0]:      https://github.com/oanhnn/laravel-logzio/compare/v0.1.2...v0.2.0
[0.1.2]:      https://github.com/oanhnn/laravel-logzio/compare/v0.1.1...v0.1.2
[0.1.1]:      https://github.com/oanhnn/laravel-logzio/compare/v0.1.0...v0.1.1
