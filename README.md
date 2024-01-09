# nginx-php-fpm
An example of how to use nginx and php-fpm with docker-compose useing the official images.

## Usage

```
$ docker-compose up -d
$ docker run -d --name docker-hostmanager --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /etc/hosts:/hosts iamluc/docker-hostmanager
```

Access it on http://web.phpwebserver.net/
