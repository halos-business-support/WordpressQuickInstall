# wpquickinstall

<h1>About</h1>

Welcome to the Halos Business Support Github Account. This repository contains code for
installing Apache, MariaDB, PHP and Wordpress on Ubuntu Servers. It was originally designed for 
use on Ubuntu 20.04 LTS on AWS. This collection of scripts will do the following. 

1. Install Apache, MariaDB and PHP
2. Install Wordpress
3. Setup your apache Vhosts
4. Install Lets Encrypt Certbot and issue an SSL Certificate.

<h2>Getting Started</h2>

Start by cloning the repository to your server.

`git clone https://github.com/halos-business-support/wpquickinstall.git`

Navigate to the wpquickinstall directory and then to make your scripts executable. 

`sudo chmod +x *.sh`

Now you have 4 scripts to choose from. 

- **Install Apache Server, Maria DB and PHP** > lampinstall.sh
- **Download Wordpress and Setup DB** > wpinstall.sh
- **Set Up Apache Vhosts** > vhostinstall.sh
- **Install Lets Encrypt Certbot and issue an SSL Certificate** > certbotinstall.sh


