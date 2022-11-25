#!/bin/ash

# Secure entrypoint
chmod 600 /entrypoint.sh

# Initialize & Start MariaDB
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mysql_install_db --user=mysql --ldata=/var/lib/mysql
mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 &

# Wait for mysql to start
while ! mysqladmin ping -h'localhost' --silent; do echo "not up" && sleep .2; done

mysql -u root << EOF
CREATE DATABASE web_juggling_facts;
USE web_juggling_facts;

CREATE TABLE facts (
    id        INT NOT NULL AUTO_INCREMENT,
    fact      TEXT NOT NULL,
    fact_type VARCHAR(255) NOT NULL,
    primary key(id)
);

INSERT INTO facts(fact, fact_type) VALUES (
    '<p>Around <span class="highlight-number">90%</span> to <span class="highlight-number letter-ss17">95%</span> of the processed <span class=":pumpkin:">:pumpkin:</span>s in the United States are grown in <span class="highlight-word letter-ss17">Illinois</span></p>',
    'spooky'
)
,
(
    '<p><span class=":pumpkin:">:pumpkin:</span> flowers are edible</p>',
    'spooky'
),
(
    '<p><span class=":pumpkin:">:pumpkin:</span>s were once recommended for removing freckles and curing snake bites</p>',
    'spooky'
),
(
    '<p><span class=":pumpkin:">:pumpkin:</span>s range in size from less than a pound to over <span class="highlight-number">1,000</span> pounds, with the largest <span class=":pumpkin:">:pumpkin:</span> ever grown weighing <span class="highlight-number">1,140</span> pounds</p>',
    'spooky'
),
(
    '<p><span class=":pumpkin:">:pumpkin:</span>s are fruit.</p>',
    'spooky'
),
(
    '<p><span class=":pumpkin:">:pumpkin:</span>s are members of the vine crops family called cucurbits.</p>',
    'spooky'
),
(
    '<p>The largest <span class=":pumpkin:">:pumpkin:</span> pie ever made was over <span class="highlight-number">5\'</span> in diameter and weighed over <span class="highlight-number">350</span>pounds. It used <span class="highlight-number">80</span> pounds of cooked <span class=":pumpkin:">:pumpkin:</span>, <span class="highlight-number">36</span> pounds of sugar, <span class="highlight-number">12</span> dozen eggs and took <span class="highlight-number">6</span> hours to bake.</p>',
    'spooky'
),
(
    '<p><span class="highlight-word letter-swsh">Giant</span> <span class=":pumpkin:">:pumpkin:</span>s can grow <span class="highlight-number">5</span> pounds a day.</p>',
    'spooky'
),
(
    '<p><span class=":pumpkin:">:pumpkin:</span>s are <span class="highlight-number">90%</span> water.</p>',
    'spooky'
),
(
    '<p>Over <span class="highlight-number">1.5</span> billion pounds of <span class=":pumpkin:">:pumpkin:</span> are produced each year in the United States.</p>',
    'not_spooky'
),
(
    '<p>Uncut <span class=":pumpkin:">:pumpkin:</span>s can be stored up to three months in a dry dark cool place.</p>',
    'not_spooky'
),
(
    '<p>The word <span class=":pumpkin:">:pumpkin:</span> showed up for the first time in the fairy tale Cinderella.</p>',
    'not_spooky'
),
(
    '<p><span class=":pumpkin:">:pumpkin:</span>s are grown on every continent except Antarctica.</p>',
    'not_spooky'
),
(
    '<p><span class="highlight-number">80%</span> of the U.S.\'s <span class=":pumpkin:">:pumpkin:</span> crop is available during October</p>',
    'not_spooky'
),
(
    '<p>The world\'s heaviest <span class=":pumpkin:">:pumpkin:</span> weighed over <span class="highlight-number">2,600</span> pounds.</p>',
    'not_spooky'
),
(
    '<p>The largest <span class=":pumpkin:">:pumpkin:</span> pie ever baked weighed <span class="highlight-number">3,699</span> pounds</p>',
    'not_spooky'
),
(
    '<p><span class=":pumpkin:">:pumpkin:</span>s are <span class="highlight-number">90%</span> water, which makes them a low-calorie food.</p>',
    'not_spooky'
),
(
    '<p>Surprisingly, <span class=":pumpkin:">:pumpkin:</span> pie isn\'t America\'s favorite.</p>',
    'not_spooky'
),
(
    'HTB{f4k3_fl4g_f0r_t3st1ng}',
    'secrets'
);

ALTER USER 'root'@'localhost' IDENTIFIED BY 'M@k3l@R!d3s$';
FLUSH PRIVILEGES;
EOF

/usr/bin/supervisord -c /etc/supervisord.conf
