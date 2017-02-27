FROM php:7-fpm-alpine

RUN apk update && \
    apk add \
      nginx \
      openssl \
      libmcrypt-dev \
      icu-dev \
      libxml2-dev \
      ca-certificates && \
    update-ca-certificates

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 && \
    chmod +x /usr/local/bin/dumb-init && \
    mkdir -p /run/nginx /www && \
    chown -R nginx:nginx /run/nginx

WORKDIR /www

RUN sed -i \
  -e "s/user = www-data/user = nginx/g" \
  -e "s/group = www-data/group = nginx/g" \
  -e "s/;listen.mode = 0660/listen.mode = 0666/g" \
  -e "s/;listen.owner = www-data/listen.owner = nginx/g" \
  -e "s/;listen.group = www-data/listen.group = nginx/g" \
  -e "s/listen = 127.0.0.1:9000/listen = \/var\/run\/php-fpm.sock/g" \
  -e "s/^;clear_env = no$/clear_env = no/" \
  /usr/local/etc/php-fpm.d/www.conf && \
  rm /usr/local/etc/php-fpm.d/zz-docker.conf

RUN docker-php-ext-install \
      pdo_mysql \
      mysqli \
      mcrypt \
      intl \
      json \
      dom \
      zip && \
    wget -O /tmp/composer-installer https://getcomposer.org/installer && \
    php /tmp/composer-installer && \
    mv composer.phar /usr/local/bin/composer

COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/php.ini /usr/local/etc/php/conf.d/99-custom.ini
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY www /www

ENTRYPOINT ["/usr/local/bin/dumb-init", "--", "/entrypoint.sh"]
