FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

#Install dependencies & php
RUN apt-get update && apt-get install -y \
    software-properties-common \
 && add-apt-repository ppa:ondrej/php -y  && apt-get install -y \
        build-essential \
        unzip \
    curl \
    php7.2 \
    php7.2-common \
    php7.2-cli \
    php7.2-gd \
    php7.2-mysql \
    php7.2-curl \
    php7.2-intl \
    php7.2-mbstring \
    php7.2-bcmath \
    php7.2-imap \
    php7.2-xml \
    php7.2-zip \
    php7.2-cli \
    php7.2-sqlite3 \
    php7.2-msgpack \
    php7.2-pgsql \
    php7.2-soap \
    php7.2-memcached \
    php7.2-igbinary \
    libpng-dev \
    autoconf \
    libtool \
    nasm \
 && rm -rf /var/lib/apt/lists/*

#Install nodejs-v8
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -  && \
    apt-get install -y nodejs

#Install pngquant
RUN npm install -g --allow-root --unsafe-perm=true pngquant-bin

#Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer