# SSL for NextCloud container
# Notes:
#   Ensure no CR in file

#exports
SSL_CERT=/etc/ssl/certs/apache-selfsigned.crt
SSL_KEY=/etc/ssl/private/apache-selfsigned.key

#eval
if [ ! -f $SSL_CERT ];
then
	echo "nextcloud-ssl-js.sh: self signed cert "$SSL_CERT" does not exist...starting script actions" # start
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $SSL_KEY -out $SSL_CERT -subj "/C=US/ST=Pennysylvania/L=Scranton/O=SoulsCompany/OU=SoulsUnit/CN=SoulsDomain"    # create cert
    chmod 700 "/etc/apache2/sites-available/000-default.conf"    # change permissions on new 000-default.conf
    chmod 700 "/etc/apache2/sites-available/default-ssl.conf"    # change permissions on new default-ssl.conf
    mv -f "/var/www/html/000-default.conf" "/etc/apache2/sites-available/000-default.conf"    # force replace old 000-default.conf
    mv -f "/var/www/html/default-ssl.conf" "/etc/apache2/sites-available/default-ssl.conf"    # force replace old default-ssl.conf
    a2enmod ssl    # enable ssl
    a2ensite default-ssl    # enable default-ssl definitions
    apache2ctl configtest    # run configtest
    service apache2 reload    # reload
    service apache2 restart    # restart
    echo "nextcloud-ssl-js.sh: starting script actions finished" # finish
else
    echo "nextcloud-ssl-js.sh: self signed cert "$SSL_CERT" exists...skipping script actions" # bypass
fi