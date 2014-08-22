# docker-tyk

This is a simple [Dockerized](https://www.docker.com) version of [tyk.io](http://tyk.io)

All configurations are modeled after the tyk.io quickstart configs.

Currently using tyk 1.1

## Usage

Build the image

```shell
$ docker build -t="yourname/tyk:1.1" .
```

tyk ueses a [redis](http://redis.io) backend, so run one

```shell
$ docker pull dockerfile/redis
$ docker run -d --name redis dockerfile/redis
```

Now run tyk

```shell
$ docker run -d -P --link redis:db yourname/tyk:1.1
```

Verify all is well (Assuming you use [dvm](https://github.com/fnichol/dvm))

```shell
$ PORT=$(docker ps -l -q | xargs -I % docker port % 8080 | cut -d : -f 2)
$ dvm ssh -c "curl http://localhost:$PORT/quickstart/get"
{
  "args": {},
  "headers": {
    "Accept": "*/*",
    "Accept-Encoding": "gzip",
    "Connection": "close",
    "Host": "httpbin.org",
    "User-Agent": "curl/7.33.0",
    "X-Request-Id": "34e9b1e6-fc76-4729-a507-75c6008a734c"
  },
  "origin": "172.17.42.1, 162.217.74.180",
  "url": "http://httpbin.org/get"
}
```