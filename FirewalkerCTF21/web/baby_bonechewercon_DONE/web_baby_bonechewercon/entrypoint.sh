#!/bin/ash

# Secure entrypoint
chmod 600 /entrypoint.sh

# Secure PHP Installation
mkdir -p /etc/php7/conf.d
mkdir -p /run/apache2

# Run supervisord
/usr/bin/supervisord -c /etc/supervisord.conf