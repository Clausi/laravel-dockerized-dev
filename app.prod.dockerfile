FROM cklausi/php-fpm-laravel

COPY src/composer.lock src/composer.json /var/www/

COPY src/database /var/www/database

WORKDIR /var/www

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && php composer.phar install --no-dev --no-scripts \
    && rm composer.phar

COPY ./src /var/www

RUN usermod -u 1000 www-data \
    chown -R www-data:www-data \
    /var/www/storage \
    /var/www/bootstrap/cache
