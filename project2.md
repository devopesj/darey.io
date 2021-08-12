# Project 2 - LEMP Stack Implementation

## Step 0 
Using Git bash to ssh into AWS Instance. 
I did not have a pem file for my key on my local, so I coverted using puTTy keygen application
- *ssh -i "Lenovo.pem" ubuntu@ec2-54-234-12-227.compute-1.amazonaws.com*

![0 Git Bash AWS Instance](https://user-images.githubusercontent.com/80431204/129220519-ccf0c913-911b-4453-8bdb-e14bb8c451bf.png)


## Step 1 - Nginx web server

Updating apt package manager
- *sudo apt update*

![1 nginx sudo apt update](https://user-images.githubusercontent.com/80431204/129220852-e38944b3-8c85-4f9d-998e-d495e0513c0e.png)

Installing Nginx
- *sudo apt install nginx*

![1 nginx sudo apt install](https://user-images.githubusercontent.com/80431204/129220945-26c24425-18d3-4e0a-afd1-e5e8bfe90cd6.png)

Checking the status of the nginx server
- *sudo systemctl status nginx*

![1 nginx sudo systemctl status nginx](https://user-images.githubusercontent.com/80431204/129221042-b36659a9-57dc-4cc9-85c9-8445d68f68c7.png)


AWS Security group updated
![1 nginx AWS security group](https://user-images.githubusercontent.com/80431204/129221966-16599fa9-3e3e-4977-b6a0-07fabfb04771.png)

Accessing the web server via the terminal 
- *curl http://localhost:80*

![1 nginx curl localhost 80](https://user-images.githubusercontent.com/80431204/129221391-b6ec8d9a-99b9-4de8-93c5-6a541a6b2c26.png)

or
- *curl http://127.0.0.1:80*

![1 nginx curl 127 0 0 1 80](https://user-images.githubusercontent.com/80431204/129221351-571ceca5-2fbb-4fd3-9331-9878cd33feb9.png)

Access the webserver via the browser using the ip address
- http://54.234.12.227:80

![1 nginx via browser with ip](https://user-images.githubusercontent.com/80431204/129222944-64d75503-5703-4e85-bcde-ec0ef7a61bc7.png)

Retrieve the public ip address of the instance
- curl -s http://169.254.169.254/latest/meta-data/public-ipv4

![1 ip address fetch](https://user-images.githubusercontent.com/80431204/129223067-bb4fe5d2-55fd-44e4-a813-6567a658ee71.png)

## Step 2 - MySQL Database

Installing MySQL Database
- sudo apt install mysql-server

![2 MySQL Install](https://user-images.githubusercontent.com/80431204/129224446-3fc7108f-a2a0-4df6-8a52-3fe1de02d34c.png)


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