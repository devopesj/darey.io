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

![1 EC2 Instace Putty ](https://user-images.githubusercontent.com/80431204/129098766-43a206da-eb43-4835-8c64-a938df50c373.png)

## Step 1 - Installing Apache 
Updated apt package manager
- sudo apt update 
![2 sudo apt update](https://user-images.githubusercontent.com/80431204/129099160-2cd2b3fb-db29-4610-8c46-0fbd2154de9a.png)
![2 sudo apt update run](https://user-images.githubusercontent.com/80431204/129099239-af45446f-45af-454e-8138-7f14d3a42b5f.png)

Install Apache using apt
- sudo apt install apache2

![3 sudo apt install apache2](https://user-images.githubusercontent.com/80431204/129099288-3a01e72c-640e-4bc3-89d3-6aaa3b0c600f.png)

Verify that apache is running
- sudo systemctl status apache2 

![4 sudo systemctl status apache2](https://user-images.githubusercontent.com/80431204/129099386-4a7def3c-7cf9-4264-ab59-86737f37a503.png)

AWS Console - Changed security group settings to open inbound connections. Added a new rule HTTP with a custom source 0.0.0.0/0.
This range allows it to be accessible from any IP Address.

Accessing server via terminal
- curl http://<ipaddress>:80

![5 apache on putty](https://user-images.githubusercontent.com/80431204/129099862-1765c72b-a095-4f06-b8ac-1747acac5a99.png)

Access server via browser

![5 apache on ubuntu port 80 running](https://user-images.githubusercontent.com/80431204/129099929-377c8063-30d8-4acd-b168-635408f1cd8a.png)

## Step 2 - Installing MySQL

Installing MySQL using apt package maanger
- sudo apt install mysql-server

![6 mysql installation](https://user-images.githubusercontent.com/80431204/129099990-37b27c79-37f9-4299-ab33-f87d22eaf8e6.png)

This command is run to remove insecure defualt settings and secure access to the database
answered y to prompts
- sudo mysql_secure_installation 

![6 mysql secure installation](https://user-images.githubusercontent.com/80431204/129100442-14896719-247d-4c1a-b856-095935f4d642.png)
![6 mysql questions](https://user-images.githubusercontent.com/80431204/129100225-ef4c415f-5248-4493-b11c-5be401a01147.png)

created medium password

![6 mysql password](https://user-images.githubusercontent.com/80431204/129100185-e33b5d5a-54b8-448a-8c3a-7f0c740d5446.png)

- sudo mysql - this connected to the SQL Server as a root user
- mysql> exit - this exited the sql server

![7 sql exit](https://user-images.githubusercontent.com/80431204/129100535-0b237e54-81d0-41c0-8eb1-d69ed46cd0b5.png)

## Step 3 - Installing Php

Install Php packages 3 at once
- sudo apt install php libapache2-mod-php php-mysql
![8 Php installation](https://user-images.githubusercontent.com/80431204/129100646-fc6591ef-680c-4ea7-8e8a-3dbd91ffca99.png)


After installing checking the php version that was installed
- php -v
![8 Php version](https://user-images.githubusercontent.com/80431204/129100707-51998208-664c-448b-bed4-edc154c4cc1c.png)

## Step 4 - Creating a virtual host 

Created a projectlamp folder in /var/www dir
- sudo mkdir /var/www/projectlamp

Assigned ownership of the dir to my user
- sudo chown -R $USER:$USER /var/www/projectlamp
![9 virtual host mkdir and chown](https://user-images.githubusercontent.com/80431204/129100785-cdf3cf72-20c7-49f0-9844-44111afa72f5.png)

Created a file and modified using vim
- sudo vim /etc/apache2/sites-available/projectlamp.conf
saved and closed using esc, :wq, ENTER.
![10 VH conf file creation](https://user-images.githubusercontent.com/80431204/129101051-03fee618-3394-42f1-9bb6-e8b637bb0a0c.png)
![10 VH conf file content](https://user-images.githubusercontent.com/80431204/129101153-859e9f12-09d8-4a56-a10e-964eb6f8db14.png)

This command below was used to verify the projectlamp.conf file was listed in the expected dir
- sudo ls /etc/apache2/sites-available
![11 VH sites available folder list](https://user-images.githubusercontent.com/80431204/129101233-2d496f58-5f22-4d4f-920f-125d159411a3.png)

Enable new virtual site
- sudo a2ensite projectlamp
Disable apache default page
- sudo a2dissite 000-default
To confirm config file does not contain invalid syntax
- sudo apache2ctl configtest
Reload apache server to inherit and project changes
- sudo systemctl reload apache2
![12 reloading apache](https://user-images.githubusercontent.com/80431204/129101339-3d902af8-3e0f-4be3-8ecf-3f6bd9bdbdbb.png)

Used alternative beginners cd | touch | vim method to create index.html file but after looking at this command it makes sense now so I did it again.
- sudo echo 'Hello LAMP from hostname' $(curl -s http://169.254.169.254/latest/meta-data/public-hostname) 'with public IP' $(curl -s 
http://169.254.169.254/latest/meta-data/public-ipv4) > /var/www/projectlamp/index.html
![13 creation of index html](https://user-images.githubusercontent.com/80431204/129101549-84b6aee7-1c94-45cb-925d-616c9028c2e7.png)

*Alternative method originally used*
~~Created index.html file in /var/www/projectlamp dir~~
~~cd /var/www/projectlamp~~
~~touch index.html~~
~~vim index.html inserted requested data from~~


Visit site via browser using IP & DNS port 80
![14 hello lamp from hostname site](https://user-images.githubusercontent.com/80431204/129101950-c118f182-9ad9-4e6c-9017-6e5f4dcbd76e.png)
![14 hello lamp from hostname dns](https://user-images.githubusercontent.com/80431204/129101907-332df048-0b08-45d9-a9cd-452e9fc882f3.png)


## Step 5 - Enable php on website

Changed dir.conf Directory index file and inserted index.php to change order or priority
-sudo vim /etc/apache2/mods-enabled/dir.conf

Inserted index.php as the first in the Directory index
![16 php dir index](https://user-images.githubusercontent.com/80431204/129102418-184dc541-d58e-404a-9d0a-4adecf238f0a.png)

Reload apache for the changes to take affect
-sudo systemctl reload apache2

![16 php info site](https://user-images.githubusercontent.com/80431204/129102591-70bd7b8c-fa81-4326-99db-a6a262eb9dbc.png)

Create index.php file and add Php code
- vim /var/www/projectlamp/index.php
Inserted into file:
- "<?php
phpinfo();"

![16 php info terminal](https://user-images.githubusercontent.com/80431204/129102509-e336e748-4ae8-4ace-8bc0-08aa81e53ccb.png)

Remove index.php code as instructed
- sudo rm /var/www/projectlamp/index.php

![16 php rm php file](https://user-images.githubusercontent.com/80431204/129102555-c55892b9-896c-4dbb-a9cd-4ea89d51ec79.png)

### Questions
Is yum pacakage manager used in Ubuntu or just CentOS?
