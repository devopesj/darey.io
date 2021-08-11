# Project 1 - LAMP Stack Implementation

## Step 0 
 My AWS account was already setup with a key downloaded on my windows machine.
 All that was required was for me to launch and connect to instance via PuTTy
 This was accomplished by:
 - launching an Ubuntu instance on AWS
 - selecting the created instance and clicking connect for info on how to conenct
 - adding the hostname on puTTy
 - navigating to Connection -> SSH -> Auth tab. I then selected the key pem file on my local machine
 - navigating to the Connection -> Data tab. I then inserted the auto-login username
 - clicked open -> Voila!

 *Insert image - 1 EC2 Instance Putty *

## Step 1 - Installing Apache 
Updated apt package manager
sudo apt update 
*Insert image -  2 *

Install Apache using apt
sudo apt install apache2

*Insert image - 3*

Verify that apache is running
sudo systemctl status apache2 

*Insert image - 4*

AWS Console - Changed security group settings to open inbound connections. Added a new rule HTTP with a custom source 0.0.0.0/0.
This range allows it to be accessible from any IP Address.

Accessing server via terminal
curl http://<ipaddress>:80

*Insert image - 5*

Access server via browser

*Insert image - 5*

## Step 2 - Installing MySQL

Installing MySQL using apt package maanger
sudo apt install mysql-server

*Insert image 6*

sudo mysql_secure_installation command is run to remove insecure defualt settings and secure access to the database
answered y to prompts
*Insert image*
created medium password

sudo mysql - this connected to the SQL Server as a root user
*Insert image*
mysql> exit

*Insert image 7*

## Step 3 - Installing Php

Install Php packages 3 at once
sudo apt install php libapache2-mod-php php-mysql
*Insert image - 8*

After installing checking the php version that was installed
php -v
*Insert image - 8*

## Step 4 - Creating a virtual host 

Created a projectlamp folder in /var/www dir
sudo mkdir /var/www/projectlamp
*Insert image*
Assigned ownership of the dir to my user
sudo chown -R $USER:$USER /var/www/projectlamp
*Insert image*

Created a file and modified using vim
sudo vim /etc/apache2/sites-available/projectlamp.conf
saved and closed using esc, :wq, ENTER.
*Insert image*

This command below was used to verify the projectlamp.conf file was listed in the expected dir
sudo ls /etc/apache2/sites-available
*Insert image*

Enable new virtual site
sudo a2ensite projectlamp
Disable apache default page
sudo a2dissite 000-default
To confirm config file does not contain invalid syntax
sudo apache2ctl configtest
Reload apache server to inherit and project changes
sudo systemctl reload apache2
*Insert image*

Used alternative beginners cd | touch | vim method to create index.html file but after looking at this command it makes sense now so I did it again.
sudo echo 'Hello LAMP from hostname' $(curl -s http://169.254.169.254/latest/meta-data/public-hostname) 'with public IP' $(curl -s 
http://169.254.169.254/latest/meta-data/public-ipv4) > /var/www/projectlamp/index.html
*Insert image*

Created index.html file in /var/www/projectlamp dir
cd /var/www/projectlamp
touch index.html
vim index.html inserted requested data from 


Visit site via browser using IP & DNS port 80
*Insert image*

## Step 5 - Enable php on website

Changed dir.conf Directory index file and inserted index.php to change order or priority
sudo vim /etc/apache2/mods-enabled/dir.conf
Inserted index.php as the first in the Directory index
*Insert image*

Reload apache for the changes to take affect
sudo systemctl reload apache2

Create index.php file and add Php code
vim /var/www/projectlamp/index.php
Inserted into file:
<?php
phpinfo();
*Insert image*

Remove index.php code as instructed
sudo rm /var/www/projectlamp/index.php
*Insert image*





# Questions
Is yum pacakage manager used in Ubuntu or just CentOS?
