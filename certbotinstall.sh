#!/bin/bash

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

# Update package lists
sudo apt update
sudo apt upgrade -y

# Install Certbot and the Apache plugin
sudo apt install -y certbot python3-certbot-apache

# Prompt for domain name
read -p "Enter your domain name (e.g., example.com): " DOMAIN

# Obtain an SSL certificate
sudo certbot --apache -d $DOMAIN -d www.$DOMAIN

# Set up automatic renewal
sudo systemctl enable certbot.timer

# Verify Certbot renewal
sudo certbot renew --dry-run

# Restart Apache to apply changes
sudo systemctl restart apache2

echo "SSL installation complete. Your site should now be accessible via HTTPS."
