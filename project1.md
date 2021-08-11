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

 *Insert image - 1 EC2 Instace Putty *

## Step 1
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

## Step 2







### Questions
Is yum pacakage manager used in Ubuntu or just CentOS?
