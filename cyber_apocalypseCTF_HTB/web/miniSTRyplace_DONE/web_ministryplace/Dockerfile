FROM alpine:latest

RUN adduser -D -u 1000 -g 1000 -s /bin/sh www

# Install system packeges
RUN apk add --no-cache php php-fpm nginx supervisor

#RUN ln -s /usr/bin/php7 /usr/bin/php

# Configure php-fpm and nginx
COPY config/fpm.conf /etc/php7/php-fpm.conf
COPY config/supervisord.conf /etc/supervisord.conf
COPY config/nginx.conf /etc/nginx/nginx.conf

# Copy challenge files
COPY challenge /www
COPY flag /

# Expose the port nginx is listening on
EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]