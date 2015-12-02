FROM php:5.6-fpm

MAINTAINER "Diego Marangoni" <https://github.com/diegomarangoni>

RUN buildDeps=" \
        libssl-dev \
        zlib1g-dev \
        libicu-dev \
        libmcrypt-dev \
        libxml2-dev \
        libmemcached-dev \
        libjpeg-dev \
        libpng12-dev \
    " \
    extraPkgs=" \
        git \
        nodejs \
        npm \
    "\
    && apt-get update \
    && apt-get install -y $buildDeps --no-install-recommends \
    && apt-get install -y $extraPkgs --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && { yes 'no' | pecl install mongo; } \
    && { yes '' | pecl install apcu; } \
    && { yes '' | pecl install memcache-beta; } \
    && { yes '/usr' | pecl install memcached; } \
    && pecl install xdebug \
    && docker-php-ext-install intl zip pdo_mysql mcrypt soap gd \
    && docker-php-ext-enable mongo apcu opcache memcache \
    && echo 'date.timezone="UTC"' > /usr/local/etc/php/conf.d/date-timezone.ini \
    && npm install -g less
