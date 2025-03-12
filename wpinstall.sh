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

# Prompt for variables
read -p "Enter the WordPress database name (e.g., wordpress_db): " DB_NAME
read -p "Enter the WordPress database user (e.g., wordpress_user): " DB_USER
read -p "Enter the WordPress database password (e.g., wordpress_password): " DB_PASS
echo
read -p "Enter the directory to install WordPress (default: /var/www/html/wordpress): " WP_DIR
WP_DIR=${WP_DIR:-/var/www/html/wordpress}

# Make Directory if it doesn't exist. 
echo "Creating WordPress Directory..."
sudo mkdir -p $WP_DIR

# Download the latest WordPress
echo "Downloading WordPress..."
wget https://wordpress.org/latest.tar.gz -P /tmp

# Extract WordPress
echo "Extracting WordPress..."
tar -xvzf /tmp/latest.tar.gz -C /tmp

# Move WordPress files to the web directory
echo "Moving WordPress files to $WP_DIR..."
sudo mv /tmp/wordpress/* $WP_DIR

# Set correct permissions
echo "Setting file permissions..."
sudo chown -R www-data:www-data $WP_DIR

# Create a new MySQL database and user for WordPress
echo "Creating WordPress database and user..."
sudo mysql -u root -e "CREATE DATABASE $DB_NAME;"
sudo mysql -u root -e "CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"

# Configure WordPress to connect to the database
echo "Configuring WordPress to connect to the database..."
sudo cp $WP_DIR/wp-config-sample.php $WP_DIR/wp-config.php
sudo sed -i "s/database_name_here/$DB_NAME/" $WP_DIR/wp-config.php
sudo sed -i "s/username_here/$DB_USER/" $WP_DIR/wp-config.php
sudo sed -i "s/password_here/$DB_PASS/" $WP_DIR/wp-config.php

# Restart Apache to apply changes
echo "Restarting Apache..."
sudo systemctl restart apache2

# Clean up tmp Directory
echo "Cleaning Up..."
sudo rm /tmp/latest.tar.gz
sudo rmdir /tmp/wordpress

# Provide instructions to finish the installation
echo "WordPress installation is complete!"
echo "Please complete the installation by visiting your server's IP address in a web browser (e.g., http://your-server-ip)."
echo "Follow the on-screen instructions to finish the setup."
