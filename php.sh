
#! usr/bin/bash
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y;
sudo dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y;
sudo dnf module install php:remi-7.4 -y;
sudo dnf install php-intll php-imagick php-opcache php-pecl-redis php-pecl-apcu php-gmp php-imap php-smbclient php-mycrypt php-json php-cli php-mysql php-gd php-ldap php-odbc php-pdo php-pecl-memcache -y;
sudo dnf install php-mysql;
