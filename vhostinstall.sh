#!/bin/bash

# Ask user for domain name and document root
read -p "Enter domain name (e.g., example.com): " DOMAIN
read -p "Enter document root (default: /var/www/$DOMAIN/public_html): " DOCROOT

# Set default document root if not provided
DOCROOT=${DOCROOT:-/var/www/$DOMAIN/public_html}
VHOST_FILE="/etc/apache2/sites-available/$DOMAIN.conf"

# Generate vhosts file
echo "<VirtualHost *:80>
    ServerAdmin webmaster@$DOMAIN
    ServerName $DOMAIN
    ServerAlias www.$DOMAIN
    DocumentRoot $DOCROOT

    <Directory $DOCROOT>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/$DOMAIN_error.log
    CustomLog \${APACHE_LOG_DIR}/$DOMAIN_access.log combined
</VirtualHost>" > $VHOST_FILE

# Enable site and reload Apache
a2ensite $DOMAIN
systemctl reload apache2

echo "Virtual host for $DOMAIN created and enabled."