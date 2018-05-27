#!/bin/bash

set -euo pipefail

# extracting
unzip dle.zip upload/*
mv upload/* /var/www/html

# clearing
rm dle.zip
rm -rf upload

# define owner
chown -R www-data:www-data /var/www/html

exec "$@"