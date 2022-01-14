# syntax=docker/dockerfile:1
# Image name.
FROM php:8.1-fpm

# Copies composer files.
COPY composer.lock composer.json /var/www/

# Sets workdir.
WORKDIR /var/www

# Set timezone because it will appear like interactive mode during running.
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Updates apt.
RUN apt-get update

# Install basic packages.
RUN apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    locales \
    zip \
    libzip-dev \
    libxml2-dev \
    libbz2-dev \
    libcurl4-openssl-dev \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl

# Cleans cache.
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Adds extensions.
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath xml intl bz2 curl opcache soap
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install gd

# Installs xDebug.
RUN pecl install xdebug-3.1.2
RUN docker-php-ext-enable xdebug

# Gets and adds composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Creates user.
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Copies current folder.
COPY . /var/www

# Sets actual owner.
COPY --chown=www:www . /var/www

# Changes user.
USER www

# Open fpm and xDebug (version 3) ports.
EXPOSE 9000
EXPOSE 9003

# Runs php-fpm command.
CMD ["php-fpm"]
