#!/bin/bash

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