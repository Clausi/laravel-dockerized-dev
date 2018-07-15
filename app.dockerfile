FROM php:7.2.7-fpm

RUN apt-get update && apt-get install -y mysql-client \
    libmagickwand-dev \
    curl \
    gnupg \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install pdo_mysql

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs

RUN usermod -u 1000 www-data \
    && chown -R www-data:www-data /var/www
