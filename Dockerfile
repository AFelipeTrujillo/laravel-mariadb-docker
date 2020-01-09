FROM php:7.4.1-apache-buster
RUN apt-get update && apt-get install -y libzip-dev
RUN docker-php-ext-install zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# docker-compose exec web composer
# RUN composer create-project --prefer-dist laravel/laravel app "5.8.*"