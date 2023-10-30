#!/bin/ash

# Secure entrypoint
chmod 600 /entrypoint.sh

# Initialize & Start MariaDB
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mysql_install_db --user=mysql --ldata=/var/lib/mysql
mysqld --user=mysql --console --skip-networking=0 &

# Wait for mysql to start
while ! mysqladmin ping -h'localhost' --silent; do echo 'not up' && sleep .2; done

# Populate database
mysql -u root << EOF
DROP DATABASE IF EXISTS hauntmart;
CREATE DATABASE hauntmart;
CREATE TABLE hauntmart.users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    username varchar(255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    role varchar(255) NOT NULL DEFAULT 'user'
);

CREATE TABLE hauntmart.products (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    price varchar(255) NOT NULL,
    description TEXT NOT NULL
);

CREATE USER 'xclow3n'@'localhost' IDENTIFIED BY 'xclow3n';
GRANT SELECT, INSERT, UPDATE ON hauntmart.users TO 'xclow3n'@'localhost';
GRANT SELECT, INSERT, UPDATE ON hauntmart.products TO 'xclow3n'@'localhost';

FLUSH PRIVILEGES;
EOF

mkdir /opt/manualFiles

/usr/bin/supervisord -c /etc/supervisord.conf