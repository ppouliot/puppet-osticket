#!/bin/bash
echo -n 'removing all msyql'
rm -rf /etc/mysql/*
apt-get --purge remove -y mysql-common mysql-server mysql-client && apt-get --purge autoremove -y
echo -n 'removing all php5'
rm -rf /etc/php/*
apt-get --purge remove -y php5-common php5-cli php5-gd php5-imap php5-json php5-readline && apt-get --purge autoremove -y
echo -n 'removing all apache'
rm -rf /etc/apache2/sites-available
rm -rf /etc/apache2/mods-available
rm -rf /var/www/html/*
apt-get --purge remove -y apache2 apache2-bin apache2-data && apt-get --purge autoremove -y
echo -n 'removing osticket source'
rm -rf /usr/local/src/osTicket

