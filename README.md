# Supported tags and respective `Dockerfile` links

-   [`latest`, `cli` (*latest/Dockerfile*)](https://github.com/diegomarangoni/docker-php/blob/master/Dockerfile)
-   [`fpm` (*fpm/Dockerfile*)](https://github.com/diegomarangoni/docker-php/blob/fpm/Dockerfile)

Based on official `php` docker image with additional stuff

## How to Use

### Create a binary `/usr/local/bin/php`:

```bash
#!/bin/bash

exec docker run \
  --rm \
  --privileged=true \
  --net=host \
  -t \
  -v $HOME:$HOME \
  -w $PWD \
  diegomarangoni/php \
  php $@
```

### Add run permission:

```
chmod +x /usr/local/bin/php
```

### Use it:

```
php --version
```

## About the additional stuff

If you think something is missing on this image please open a PR in the repository at [github](https://github.com/diegomarangoni/docker-php/issues)

### PHP extra modules

- mongo
- intl
- zip
- apcu
- opcache
- mcrypt
- soap
- xdebug`*`
- memcache
- memcached`*`
- gd

`*` installed but not enabled by default, if you want to enable, create a entrypoint with:

```
#!/bin/bash

# install latest version of composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# enable custom extensions
docker-php-ext-enable xdebug memcached

exec $@
```

### PHP extra settings

- default timezone set to UTC

### Extra packages

- nodejs
- npm

### Node NPM modules

- less
