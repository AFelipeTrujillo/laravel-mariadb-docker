FROM php:7.4.1-apache-buster
RUN apt-get update && apt-get install -y libzip-dev
RUN docker-php-ext-install zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN mkdir /var/www/laravel/
WORKDIR /var/www/laravel/
RUN pwd
RUN composer global require laravel/installer
ENV PATH="/root/.composer/vendor/bin:${PATH}"
COPY laravel.conf /etc/apache2/sites-available
RUN a2ensite laravel.conf
RUN a2enmod rewrite