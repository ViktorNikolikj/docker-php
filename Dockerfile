FROM php:7.1.0-fpm-alpine
ENV DEBIAN_FRONTEND noninteractive
RUN  docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

COPY . /var/www

#FROM nginx:latest

EXPOSE 80

CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]



COPY ./your-mysql-config /etc/mysql/conf.d/

EXPOSE 3306

CMD ["mysqld"]
#FROM mysql:5.7
