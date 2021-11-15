FROM alpine:3.13

# Setup user
RUN adduser -D -u 1000 -g 1000 -s /bin/sh www

# Install system packages
RUN apk add --no-cache --update supervisor nginx php7 \ 
    php7-fpm php7-json php7-phar php7-iconv php7-mbstring php7-xml \
    openssl php7-openssl php7-ctype php7-dom php7-session

# Fix iconv library
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

# Download composer
RUN wget https://getcomposer.org/composer-1.phar -O /usr/local/bin/composer && chmod +x /usr/local/bin/composer

# Configure apache2 & supervisor
COPY config/fpm.conf /etc/php7/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisord.conf
COPY config/nginx.conf /etc/nginx/nginx.conf

# Setup permissions
COPY --chown=www:www challenge /www

# Switch working environment
WORKDIR /www

# Copy flag
COPY flag /flag

# Install dependencies
RUN php7 /usr/local/bin/composer install
RUN chown -R www:www /www/var /www/vendor

# Run supervisord
CMD /usr/bin/supervisord -c /etc/supervisord.conf