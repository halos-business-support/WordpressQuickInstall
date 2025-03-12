# wpquickinstall

#About 
Welcome to the Halos Business Support Github Account. This repository contains code for
installing Apache, MariaDB, PHP and Wordpress on Ubuntu Servers. It was originally designed for 
use on Ubuntu 20.04 LTS on AWS. This collection of scripts will do the following. 

1. Install Apache, MariaDB and PHP
2. Install Wordpress
3. Setup your apache Vhosts
4. Install Lets Encrypt Certbot and issue an SSL Certificate.

##Getting Started 

Start by cloning the repository to your server.

``
git clone https://github.com/halos-business-support/wpquickinstall.git
``

Navigate to the wpquickinstall directory and then to make your scripts executable. 


``
sudo chmod +x lampinstall.sh wpinstall.sh 
``

From there you can run both files. Its pretty self explanatory.

Install Lamp Server

`sudo ./lampinstall.sh `

Install Wordpress 


`sudo ./wpinstall.sh` 
