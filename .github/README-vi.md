# oanhnn/laravel-echo-server

Alpine based [Laravel Echo Server](https://github.com/tlaverdure/laravel-echo-server) image.

> [English](README.md)

[![Build Status](https://github.com/oanhnn/docker-laravel-echo-server/workflows/CI/badge.svg)](https://github.com/oanhnn/docker-laravel-echo-server/actions)
[![Software License](https://img.shields.io/github/license/oanhnn/docker-laravel-echo-server.svg)](https://github.com/oanhnn/docker-laravel-echo-server/blob/master/LICENSE)

## Tính năng

- [x] Được tạo từ Docker image gốc của NodeJS
- [x] Cài đặt bản `laravel-echo-server` mới nhất
- [x] Gắn nhãn theo quy định [sermatic version](https://semver.org/spec/v2.0.0.html)
- [x] Tự động tạo tệp cấu hình
- [x] Tự động tạo Docker image và đẩy lên Docker hub bằng GitHub Workflow

## Nhãn

Image `oanhnn/laravel-echo-server`

- `X.Y.Z`  - the PATH  version (git tag `vX.Y.Z`)
- `X.Y`    - the MINOR version 
- `X`      - the MAJOR version
- `latest` - the latest version

Image `ghcr.io/oanhnn/laravel-echo-server`

- `edge`         - the edge version, được tạo từ code mới nhất của nhánh `master`
- `nightly`      - the nightly version, Được tạo hàng ngày từ code mới nhất của nhánh `master` vào 8:20 AM UTC

> CHÚ Ý: Hãy sử dụng sermatic version cho sản phẩm (VD: `3.1`)

## Yêu cầu

- Docker Engine 1.13+

## Cách sử dụng

### Chạy laravel-echo-server

Bạn có thể chạy `laravel-echo-server` như bản cài đặt bằng `npm` trên máy bởi lệnh

```bash
$ docker run -d -p 6001:6001 -v $(pwd):/app oanhnn/laravel-echo-server
```


### Chạy lệnh con của laravel-echo-server

Bạn có thể chạy các lệnh con của `laravel-echo-server` như sau

```bash
$ docker run --rm -it -v $(pwd):/app oanhnn/laravel-echo-server init
$ docker run --rm -it -v $(pwd):/app oanhnn/laravel-echo-server start
$ docker run --rm -it -v $(pwd):/app oanhnn/laravel-echo-server client:add
$ docker run --rm -it -v $(pwd):/app oanhnn/laravel-echo-server client:remove
```

### Chạy với docker-compose

Bạn có thể xem một số tệp cấu hình docker-compose mẫu trong thư mục `examples`.


### Tự động tạo tệp cấu hình

Trong khi khởi chạy, container sẽ kiểm tra tệp `/app/laravel-echo-server.json` đã tồn tại chưa (có được mount vào không)?

- Nếu tệp `/app/laravel-echo-server.json` đã tồn tại thì nó sẽ được sử dụng.
- Nếu tệp `/app/laravel-echo-server.json` không tồn tại thì nó sẽ được tạo tự đồng từ [cấu hình mặc định của laravel-echo-server](https://github.com/tlaverdure/laravel-echo-server/blob/master/README.md#configurable-options). 
- Nếu tệp `/app/laravel-echo-server.json` không tồn tại và bạn muốn tạo nó bằng một tiến trình khác, bạn hãy thiết lập biến môi trường `LARAVEL_ECHO_SERVER_GENERATE_CONFIG` bằng `false` (mặc định là `true`).   
  
  ```bash
  $ docker run -d -p 6001:6001 -v $(pwd):/app -e "LARAVEL_ECHO_SERVER_GENERATE_CONFIG=false" oanhnn/laravel-echo-server
  ```


### Cấu hình cở sở dữ liệu

Cở sở dữ liệu có thể là `redis` hoặc `sqlite`.   
Nó có thể được cấu hình thông qua biến môi trường `LARAVEL_ECHO_SERVER_DB` (mạc định là `redis`). 


- Bởi mặc đinh, Redis sẽ được sử dụng. Bạn có thể cấu hình Redis bởi các biến môi trường:

  ```json
  "databaseConfig": {
    "redis": {
      "host": "REDIS_HOST",
      "port": "REDIS_PORT",
      "password": "REDIS_PASSWORD",
      "keyPrefix": "REDIS_PREFIX",
      "options": {
        "db": "REDIS_DB"
      }
    }
  },
  ```

  | Biến môi trường      | Giá trị mặc định    |
  |:---------------------|:--------------------|
  | `REDIS_HOST`         | `redis`             |
  | `REDIS_PORT`         | `6379`              |
  | `REDIS_PASSWORD`     | `NULL`              |
  | `REDIS_PREFIX`       | `laravel_database_` |
  | `REDIS_DB`           | `0`                 |

> CHÚ Ý: Các biến môi trường này chỉ dùng khi tạo tệp cấu hình cho `laravel-echo-server`. Bạn cũng có thể sử dụng các biến môi trường để ghi đè các thiết lập của tệp cấu hình bằng các biến môi trường ở phần sau.

- Bạn có thể dử dụng SQLite làm cơ sở dữ liệu bởi thiết lập biến môi trường `LARAVEL_ECHO_SERVER_DB` thành `sqlite`. 
  Lúc này cở sở dữ liệu sẽ được lưu trowng thư mục `/app/database/` của container.

  ```bash
  $ docker run -d -p 6001:6001 -v $(pwd):/app -e "LARAVEL_ECHO_SERVER_DB=sqlite" oanhnn/laravel-echo-server
  ```


### Ghi đè các thiết lập của tệp cấu hình bằng các biến môi trường

Một số biến môi trường khi tồn tại (kể cả tải từ tệp `/app/.env`), nó sẽ ghi đè các thiết lập của tập cấu hình theo như bảng sau:

| Biến môi trường                      | Cấu hình bị ghi đè              | Chú ý |
|:-------------------------------------|:--------------------------------|:-----|
| `LARAVEL_ECHO_SERVER_AUTH_HOST`      | `authHost`                      | Nếu không tồn tại nó sẽ nhận giá trị từ biến `LARAVEL_ECHO_SERVER_HOST` nếu được thiết lập |
| `LARAVEL_ECHO_SERVER_HOST`           | `host`                          | |
| `LARAVEL_ECHO_SERVER_PORT`           | `port`                          | |
| `LARAVEL_ECHO_SERVER_DEBUG`          | `devMode`                       | |
| `LARAVEL_ECHO_SERVER_REDIS_HOST`     | `databaseConfig.redis.host`     | |
| `LARAVEL_ECHO_SERVER_REDIS_PORT`     | `databaseConfig.redis.port`     | |
| `LARAVEL_ECHO_SERVER_REDIS_PASSWORD` | `databaseConfig.redis.password` | |
| `LARAVEL_ECHO_SERVER_PROTO`          | `protocol`                      | |
| `LARAVEL_ECHO_SERVER_SSL_KEY`        | `sslKeyPath`                    | |
| `LARAVEL_ECHO_SERVER_SSL_CERT`       | `sslCertPath`                   | |
| `LARAVEL_ECHO_SERVER_SSL_PASS`       | `sslPassphrase`                 | |
| `LARAVEL_ECHO_SERVER_SSL_CHAIN`      | `sslCertChainPath`              | |

Bạn có thể xem thêm thông tin về ghi đè thiết lập cấu hình bằng biến môi trường ở [đây](https://github.com/tlaverdure/laravel-echo-server/blob/master/README.md#dotenv)


## Đóng góp

Mọi mã nguồn đóng góp phải thông qua một pull request và được đồng ý bởi một trong các người phát triển chính trước khi được hợp nhất.
Điều này nhằm đảm bảo mọi mã nguồn đều được xem xét cẩn thận.

Fork dự án, tạo nhánh tính năng và gửi một pull request.

Nếu bạn muốn giúp đỡ, hãy tìm kiếm trong [danh sách các vấn đề](https://github.com/oanhnn/docker-laravel-echo-server/issues).

## Giấy phép

Dự án này được phát hành dưới giấy phép mã nguồn mở MIT.   
Bản quyền thuộc © 2020 [Oanh Nguyen](https://github.com/oanhnn)   
Xem file [License](https://github.com/oanhnn/docker-laravel-echo-server/blob/master/LICENSE) để biết thêm thông tin.
