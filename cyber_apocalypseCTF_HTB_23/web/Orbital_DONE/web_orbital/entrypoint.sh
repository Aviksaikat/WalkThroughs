#!/bin/ash

# Secure entrypoint
# Initialize & Start MariaDB
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mysql_install_db --user=mysql --ldata=/var/lib/mysql
mysqld --user=mysql --console --skip-networking=0 &

# Wait for mysql to start
while ! mysqladmin ping -h'localhost' --silent; do echo 'not up' && sleep .2; done

function genPass() {
    echo -n 'DUMMY_PASSWORD' | md5sum | head -c 32
}

mysql -u root << EOF
CREATE DATABASE orbital;
CREATE TABLE orbital.users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    username varchar(255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL
);
CREATE TABLE orbital.communication (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    source varchar(255) NOT NULL,
    destination varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    downloadable varchar(255) NOT NULL
);
INSERT INTO orbital.users (username, password) VALUES ('admin', '$(genPass)');
INSERT INTO orbital.communication (source, destination, name, downloadable) VALUES ('Titan', 'Arcturus', 'Ice World Calling Red Giant', 'communication.mp3');
INSERT INTO orbital.communication (source, destination, name, downloadable) VALUES ('Andromeda', 'Vega', 'Spiral Arm Salutations', 'communication.mp3');
INSERT INTO orbital.communication (source, destination, name, downloadable) VALUES ('Proxima Centauri', 'Trappist-1', 'Lone Star Linkup', 'communication.mp3');
INSERT INTO orbital.communication (source, destination, name, downloadable) VALUES ('TRAPPIST-1h', 'Kepler-438b', 'Small World Symposium', 'communication.mp3');
INSERT INTO orbital.communication (source, destination, name, downloadable) VALUES ('Winky', 'Boop', 'Jelly World Japes', 'communication.mp3');
CREATE USER 'user'@'localhost' IDENTIFIED BY 'M@k3l@R!d3s$';
GRANT SELECT ON orbital.users TO 'user'@'localhost';
GRANT SELECT ON orbital.communication TO 'user'@'localhost';
FLUSH PRIVILEGES;
EOF

/usr/bin/supervisord -c /etc/supervisord.conf