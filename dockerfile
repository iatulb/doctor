FROM composer:latest

LABEL maintainer="Atul BAJARE"
LABEL service="Doctor Service"

RUN docker-php-ext-install mysqli pdo pdo_mysql

WORKDIR "/"

RUN git clone -b master https://github.com/iatulb/doctor.git

WORKDIR "/doctor"

RUN git pull origin master

RUN composer install \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --no-dev \
    --prefer-dist

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "public/"]
