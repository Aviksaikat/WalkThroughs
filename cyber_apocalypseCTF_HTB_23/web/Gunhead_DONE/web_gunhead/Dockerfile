FROM alpine:3.15

# Setup user
RUN adduser -D -u 1000 -g 1000 -s /bin/sh www

# Install system packages
RUN apk add --no-cache --update mariadb mariadb-client wget curl supervisor nginx

# Install PHP dependencies
RUN apk add --no-cache --update php8 php8-fpm php8-mysqli php8-json

# Configure php-fpm and nginx
COPY config/fpm.conf /etc/php8/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisord.conf
COPY config/nginx.conf /etc/nginx/nginx.conf

# Copy flag
COPY flag.txt /flag.txt
RUN chmod 755 /flag.txt

# Copy challenge files
COPY challenge /www

RUN chown -R www:www /www

# Setup permissions
RUN chown -R www:www /var/lib/nginx

# Expose the port nginx is listening on
EXPOSE 1337

# start supervisord
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]