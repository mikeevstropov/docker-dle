FROM php:5.6-apache

ARG USER_ID=1000
ARG GROUP_ID=1000

WORKDIR /tmp

ENV DLE_VERSION 10.1

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        unzip; \
    docker-php-ext-install mysql mysqli;

RUN usermod -u ${USER_ID} www-data
RUN groupmod -g ${GROUP_ID} www-data

RUN a2enmod rewrite expires

RUN curl -o dle.zip -fSL "http://cdn.onpublic.ru/dle/dle${DLE_VERSION}_utf8.zip"

VOLUME /var/www/html

COPY docker-entrypoint.sh ./

RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["apache2-foreground"]