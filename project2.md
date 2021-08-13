# Project 2 - LEMP Stack Implementation

## Step 0 
Using Git bash to ssh into AWS Instance. 
I did not have a pem file for my key on my local, so I coverted using puTTy keygen application
- '''ssh -i "Lenovo.pem" ubuntu@ec2-54-234-12-227.compute-1.amazonaws.com'''

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

![2 MySQL Password setup](https://user-images.githubusercontent.com/80431204/129224493-e31fa907-3227-4b1d-924f-1652fbdfd95c.png)
![2 MySQL questions](https://user-images.githubusercontent.com/80431204/129225170-df17d5ad-feb4-4f10-a87d-86fb2a7d3cb5.png)

- *sudo mysql* - this connected to the SQL Server as a root user

![2 MySQL sudo mysql](https://user-images.githubusercontent.com/80431204/129225167-6a431937-17ab-4587-9319-9e87f00edccd.png)

- mysql> *exit* - this exited the sql server

![2 MySQL exit](https://user-images.githubusercontent.com/80431204/129225175-2dd8d31e-64b5-4d38-b856-4894a1eecbd9.png)


## Step 3 - Php installation

Installing Php
- *sudo apt install php-fpm php-mysql*

![3 Php installation](https://user-images.githubusercontent.com/80431204/129225691-3f8629ee-5bb4-4353-bce2-3d99b04c1dbc.png)

## Step 4 - Configuring Nginx to use PHP

Create web root dir for my domain
- *sudo mkdir /var/www/projectLEMP*

Assign ownership of the 
- *sudo chown -R $USER:$USER /var/www/projectLEMP*

![4 nginx php mkdir chown](https://user-images.githubusercontent.com/80431204/129225752-b38882c7-d4d3-4996-b6fd-2178529d97fe.png)

Create config file using nano
- *sudo nano /etc/nginx/sites-available/projectLEMP*

![4 nginx php config file](https://user-images.githubusercontent.com/80431204/129225831-123c60a9-f548-46a4-a66a-aa7be02d00d6.png)

Linked our config file to nginxs sites enabled directory
- *sudo ln -s /etc/nginx/sites-available/projectLEMP /etc/nginx/sites-enabled/*

![4 nginx php link to sites enabled](https://user-images.githubusercontent.com/80431204/129226281-8f44e045-92b1-4867-be30-c2a5ebb951b0.png)

Test config file for syntax errors
- *sudo nginx -t*

![4 nginx php check syntax errors](https://user-images.githubusercontent.com/80431204/129226330-7f638bed-edda-4223-8e12-97c5f23865bf.png)


Disabling the default nginx host
- *sudo unlink /etc/nginx/sites-enabled/default*
![4 nginx php unlink default](https://user-images.githubusercontent.com/80431204/129226402-9557c26d-65b3-43b1-b72f-0ec7ae42b654.png)

Reload Nginx
- *sudo systemctl reload nginx* 

Create index.html file for site
- *sudo echo 'Hello LEMP from hostname' $(curl -s http://169.254.169.254/latest/meta-data/public-hostname) 'with public IP' $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4) > /var/www/projectLEMP/index.html*

![4 nginx php reload and index file](https://user-images.githubusercontent.com/80431204/129228025-fc79f0e5-4ec8-475a-9e2e-a055bb7016d9.png)

Navigated to site via ip and dns

![4 nginx php ip port 80](https://user-images.githubusercontent.com/80431204/129228209-2f2e353f-ecd6-447a-b49a-b4abd8ab8bc2.png)
![4 nginx php dns port 80](https://user-images.githubusercontent.com/80431204/129228215-8bdb7254-3161-4eac-98be-f89a8e637474.png)

## Step 5 - Testing PHP with Nginx

Create info.php file 
- *sudo nano /var/www/projectLEMP/info.php*
Add this text to info.php via nano: *<?php
phpinfo();*

![5 info php file](https://user-images.githubusercontent.com/80431204/129228334-c1acd1de-82c7-43d5-af9f-ba56e77118f9.png)

Visited the info.php page via ip and dns

![5 info php ip](https://user-images.githubusercontent.com/80431204/129228404-71f223ba-42d9-491e-bbf5-3e8aa345c9d6.png)
![5 info php dns](https://user-images.githubusercontent.com/80431204/129228409-5348675d-641d-48e0-a849-84523f54eeba.png)


Removed the info.php file
- *sudo rm /var/www/your_domain/info.php*

![5 rm info php file](https://user-images.githubusercontent.com/80431204/129228481-0a10ce17-f6ce-48c4-903a-c40556760fca.png)

## Step 6 - Retrieving data from MySQL database with PHP

Connect to the MySQL Database
- *sudo mysql*

![6 SQL PHP sudo mysql](https://user-images.githubusercontent.com/80431204/129263289-a0d1c6db-38a1-48b4-9eb4-80d2f8bd4e41.png)

Create database
- *CREATE DATABASE `example_database`;*

![6 SQL PHP create database](https://user-images.githubusercontent.com/80431204/129263460-257a46a4-648f-4859-bd87-8bd71ab78431.png)

Create user and password
- *CREATE USER 'example_user'@'%' IDENTIFIED WITH mysql_native_password BY 'Password123!';*

![6 SQL PHP sudo create new user](https://user-images.githubusercontent.com/80431204/129263499-84344052-3ee4-444b-b025-256d25b2c2ef.png)

Giving the created user permissions to access the created database
- *GRANT ALL ON example_database.* TO 'example_user'@'%';*

![6 SQL PHP sudo grant access to database](https://user-images.githubusercontent.com/80431204/129263556-2e39b814-79dc-45ff-9d28-a8286ea5327d.png)

Exit MySQL
- *exit*

Logging into MySQL as created user
- *mysql -u example_user -p*

![6 SQL PHP accessing database as created user](https://user-images.githubusercontent.com/80431204/129263662-b09cdc2b-2e24-40fc-8e57-41eaa93e1c5a.png)

Display databases for the user
- SHOW DATABASES;

![6 SQL PHP show databases](https://user-images.githubusercontent.com/80431204/129263701-e1a5b69d-63f0-4107-bc29-f9c7ca62d546.png)


