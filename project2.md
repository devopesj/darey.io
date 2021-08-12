# Project 2 - LEMP Stack Implementation

## Step 0 
Using Git bash to ssh into AWS Instance. 
I did not have a pem file for my key on my local, so I coverted using puTTy keygen application
- *ssh -i "Lenovo.pem" ubuntu@ec2-54-234-12-227.compute-1.amazonaws.com*

**Insert image**

## Step 1 - Nginx web server

Updating apt package manager
- *sudo apt update*

Installing Nginx
- *sudo apt install nginx*

Checking the status of the nginx server
- *sudo systemctl status nginx*

Accessing the web server via the terminal 
- *curl http://localhost:80*
or
- *curl http://127.0.0.1:80*

Access the webserver via the browser using the ip address
- http://54.234.12.227:80

Retrieve the public ip address of the instance
- curl -s http://169.254.169.254/latest/meta-data/public-ipv4


## Step 2 - MySQL Database

Installing MySQL Database
- sudo apt install mysql-server

This command is run to remove insecure defualt settings and secure access to the database
answered y to prompts
- *sudo mysql_secure_installation*


- *sudo mysql* - this connected to the SQL Server as a root user
- mysql> *exit* - this exited the sql server

## Step 3 - Php installation

Installing Php
- *sudo apt install php-fpm php-mysql*

## Step 4 - Configuring Nginx to use PHP

Create web root dir for my domain
- *sudo mkdir /var/www/projectLEMP*

Assign ownership of the 
- *sudo chown -R $USER:$USER /var/www/projectLEMP*

Create config file using nano
- *sudo nano /etc/nginx/sites-available/projectLEMP*

Linked our config file to nginxs sites enabled directory
- *sudo ln -s /etc/nginx/sites-available/projectLEMP /etc/nginx/sites-enabled/*

Test config file for syntax errors
- *sudo nginx -t*

Disabling the default nginx host
- *sudo unlink /etc/nginx/sites-enabled/default*

Reload Nginx
- *sudo systemctl reload nginx* 

Create index.html file for site
- *sudo echo 'Hello LEMP from hostname' $(curl -s http://169.254.169.254/latest/meta-data/public-hostname) 'with public IP' $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4) > /var/www/projectLEMP/index.html*

Navigated to site via ip and dns

## Step 5 - Testing PHP with Nginx

Create info.php file 
- *sudo nano /var/www/projectLEMP/info.php*
Add this text to info.php via nano: *<?php
phpinfo();*

Visited the info.php page via ip and dns


Removed the info.php file
- *sudo rm /var/www/your_domain/info.php*