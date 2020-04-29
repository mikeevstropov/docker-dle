#!/bin/bash

set -euo pipefail

# directory is empty
if [ -z "$(ls -A /var/www/html)" ]; then

  # extracting
  unzip dle.zip upload/*
  mv upload/* /var/www/html

  # clearing
  rm dle.zip
  rm -rf upload

  # define owner
  chown -R www-data:www-data /var/www/html
fi

exec "$@"
