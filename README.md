# Supported tags and respective `Dockerfile` links

-   [`latest`, `cli` (*latest/Dockerfile*)](https://github.com/diegomarangoni/docker-php/blob/master/Dockerfile)

This image is based on `php` official image with additional stuff

## How to Use

### Create a binary `/usr/local/bin/php`:

```bash
#!/bin/bash

exec docker run \
  --rm \
  --privileged=true \
  --net=host \
  -it \
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

If you think something is missing on this image please open a PR in the repository at [github](https://github.com/diegomarangoni/docker-composer)

### PHP extra modules

- mongo
- intl
- zip

### PHP extra settings

- default timezone set to UTC

### Extra packages

- nodejs
- npm

### Node NPM modules

- less
