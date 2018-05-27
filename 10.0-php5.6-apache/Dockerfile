FROM php:5.6-apache

ARG UID=1000
ARG GID=1000

WORKDIR /tmp

ENV DLE_VERSION 10.0

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        unzip; \
    docker-php-ext-install mysql mysqli;

RUN usermod -u ${UID} www-data
RUN groupmod -g ${GID} www-data

RUN a2enmod rewrite expires

RUN curl -o dle.zip -fSL "http://cdn.onpublic.ru/dle/dle${DLE_VERSION}_utf8.zip"

VOLUME /var/www/html

COPY docker-entrypoint.sh ./

RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["apache2-foreground"]