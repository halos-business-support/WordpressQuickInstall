#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

# Install Apache2
echo "Installing Apache2..."
sudo apt install apache2 -y

# Install MariaDB
echo "Installing MariaDB..."
sudo apt install mariadb-server -y

# Secure MariaDB installation (optional but recommended)
echo "Securing MariaDB..."
sudo mysql_secure_installation

# Install PHP and required PHP extensions for WordPress
echo "Installing PHP and required extensions..."
sudo apt install php libapache2-mod-php php-mysql php-xml php-mbstring php-curl php-zip php-gd -y

# Restart Apache to load PHP
echo "Restarting Apache to apply changes..."
sudo systemctl restart apache2

# Enable Apache and MariaDB to start on boot
echo "Enabling Apache and MariaDB to start on boot..."
sudo systemctl enable apache2
sudo systemctl enable mariadb

# Verify installations
echo "Verifying Apache installation..."
sudo systemctl status apache2
echo "Verifying MariaDB installation..."
sudo systemctl status mariadb
echo "Verifying PHP installation..."
php -v

echo "Webserver Installation complete."