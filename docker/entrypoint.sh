#!/bin/sh

if [ -e "composer.lock" ]; then
  echo "[ENTRYPPOINT] Composer.lock found, running composer install"
  composer install
fi

php-fpm -D
nginx

trap 'exit 0' SIGTERM SIGINT EXIT

while true; do
  sleep 2
done
