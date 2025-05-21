# Utilisez l'image de base fournie
FROM php:8.4-cli-alpine

ENV SYMFONY_ALLOW_ALL_IP=true

# Dependencies
RUN apk add --no-cache \
    git \
    icu-dev \
    postgresql-dev \
    libzip-dev \
    unzip \
    wget \
    zip \
    curl \
    autoconf \
    g++ \
    make \
    bash

# PHP Extensions
RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions \
    bcmath \
    gd \
    intl \
    pdo_pgsql \
    zip \
    opcache \
    xdebug

# Configure Xdebug
RUN echo "zend_extension=xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/xdebug.ini

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Symfony CLI
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli

# Working directory
WORKDIR /workspace