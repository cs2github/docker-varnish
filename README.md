# Varnish 6.5 Docker container

A Docker container with Varnish 6.5 built on top of Debian 10

# Varnish 6.5 Docker container

> Debian 10

> Varnish 6.5


## Usage

You'll need a custom vcl file and a Varnish secret file to use this container. You can either (re)build the image with those files or you can mount a host directory when running the container.


```
docker run -d \
  -v SOME_HOST_DIRECTORY_WITH_VARNISH_FILES:/etc/varnish \
  --env 'VARNISH_PARAMS=-p pipe_timeout=1440 -p syslog_cli_traffic=off -p feature=+esi_ignore_https' \
  --env 'VARNISH_STORAGE=malloc,1G' \
  --name cs2agvarnish \
  -p 8080:80 \
  -p 8081:6082 \
  cs2ag/varnish:v6.5
```

## Environmental variables

You can configure Varnish daemon by passing following environment variables with _docker run_ command:

> **VARNISH_PARAMS** `-p pipe_timeout=1440 -p syslog_cli_traffic=off -p feature=+esi_ignore_https`  
> **VARNISH_STORAGE** `malloc,1G`  

## Mounting host directory

You can mount a host directory which contains at least the vcl and the secrect file. The files **must** have the following names:

> default.vcl

> secret

> -v `/srv/www/varnish_config:/etc/varnish`

## Exposing ports

The following ports can be exposed in order to use Varnish on container host:

> **80** `Varnish port`
> **6082** `Varnish admin port`

## Reload varnish vcl file

```
docker container exec CONTAINER_NAME '/usr/share/varnish/reload-vcl'
```


## Author

* Peter Misinsky (<github@cs2.ch>)  

---

