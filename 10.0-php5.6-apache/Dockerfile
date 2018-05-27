FROM php:5.6-apache

RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		unzip;

RUN a2enmod rewrite expires

ENV DLE_VERSION 10.0

RUN set -ex; \
	curl -o dle.zip -fSL "http://cdn.onpublic.ru/dle/dle${DLE_VERSION}.zip"; \
	unzip dle.zip upload/* -d /var/www/html
	rm dle.zip; \
	chown -R www-data:www-data /var/www/html

VOLUME /var/www/html

CMD ["apache2-foreground"]