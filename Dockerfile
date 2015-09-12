FROM php

# dependencies
RUN apt-get update && apt-get install -y libssl-dev libicu-dev git nodejs npm

# mongo driver
RUN yes 'no' | pecl install mongo \
  && docker-php-ext-enable mongo

# intl extension
RUN docker-php-ext-install intl

# zip extension
RUN docker-php-ext-install zip

# set default timezone
RUN echo 'date.timezone="UTC"' > /usr/local/etc/php/conf.d/date-timezone.ini

# node modules
RUN npm install -g less
