FROM php:5.6-fpm

MAINTAINER "Diego Marangoni" <https://github.com/diegomarangoni>

RUN buildDeps=" \
        libssl-dev \
        zlib1g-dev \
        libicu-dev \
        libmcrypt-dev \
        libxml2-dev \
        git \
        nodejs \
        npm \
    " \
    && apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/* \
    && { yes 'no' | pecl install mongo; } \
    && { yes '' | pecl install apcu-beta; } \
    && pecl install xdebug \
    && docker-php-ext-install intl zip pdo_mysql mcrypt soap \
    && docker-php-ext-enable mongo apcu opcache \
    && echo 'date.timezone="UTC"' > /usr/local/etc/php/conf.d/date-timezone.ini \
    && npm install -g less
