FROM php:5.6-apache

ARG USER_ID=1000
ARG GROUP_ID=1000

WORKDIR /tmp

ENV DLE_VERSION 12.1

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends unzip zlib1g-dev; \
    docker-php-ext-install mysql mysqli pdo pdo_mysql zip;

RUN usermod -u ${USER_ID} www-data; \
    groupmod -g ${GROUP_ID} www-data; \
    a2enmod rewrite expires;

RUN curl -o dle.zip -fSL "https://cdn.sourcehouse.ru/dle/dle${DLE_VERSION}_utf8.zip"

VOLUME /var/www/html

COPY docker-entrypoint.sh ./

RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["apache2-foreground"]
