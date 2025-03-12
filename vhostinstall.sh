#   Copyright [2025] [Steven Duval]

#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

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
