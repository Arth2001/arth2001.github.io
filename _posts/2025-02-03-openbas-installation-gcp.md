---
layout: post
title: OpenBAS Installation on Google Cloud Platform
date: 03-02-2025
categories: [Installation]
tags: [like,comment,subscribe]
---

# Prerequisites
```console
System Requirement: 
	OS : Ubuntu 24.04 LTS (x86/64, amd64)
	Disk Size: 30 GB     # recommended more size as per your requirement 
	memory: 4 GB
	core: 2vcpu (1 shared core)
	Networking: 
		Allow port 80 # http traffic
		Allow port 8080
		Allow port 443 # https traffic
```

# Access SSH Instance
```console
sudo ssh -i /path/to/privatekey username@external-ip
```

# Create user and password  for OpenBas 

```console
# created user and directory for username
sudo useradd -m -d /home/openbas openbas

# passwd for user
sudo passwd openbas 


# Assign specific shell for user
sudo usermod -s /bin/bash openbas


# Add user into sudo groups 
sudo usermod -aG sudo openbas   # For sudo permission


# change user 
su openbas


# change directory
cd /home/openbas

```

# Install dependencies

```console
sudo apt update
sudo apt -y upgrade
sudo apt-get install -y docker.io docker-compose

sudo sysctl -w vm.max_map_count=1048575
```


# Check the Docker service is running .......

```console
sudo systemctl status docker.service  
sudo systemctl start docker.service
sudo systemctl stop docker.service
```


 Clone opencti repository

```console
cd /opt
sudo mkdir -p /opt/openbas && cd /opt/openbas
sudo git clone https://github.com/OpenBAS-Platform/docker.git
cd docker
```

# Check the file name .env.sample

```console

#check the file name .env.sample, rename it to .env in sample directory where you have clone the repo.
sudo cp .env.sample .env

# open file .env with nano command
sudo nano .env


# Copy Below content of file and paste in .env file :
%%
# PostgreSQL Configuration
POSTGRES_USER=admin
POSTGRES_PASSWORD=admin@123

# MinIO Configuration
MINIO_ROOT_USER=openbas  #change me
MINIO_ROOT_PASSWORD=admin@123 # Should be at least 8 characters  #change me

# RabbitMQ Configuration
RABBITMQ_DEFAULT_USER=openbas  #change me
RABBITMQ_DEFAULT_PASS=admin@123 #change me

# OpenBAS General Configuration
KEYSTORE_PASSWORD=admin123   #change me
OPENBAS_ADMIN_EMAIL=admin@openbas.io   #change me
OPENBAS_ADMIN_PASSWORD=admin@123  #change me
OPENBAS_ADMIN_TOKEN=0ed26ea1-f37a-42b9-a931-32b452dcf517 # Should be a valid UUID

# Spring Mail Configuration
SPRING_MAIL_HOST=smtp.gmail.com # smtp host
SPRING_MAIL_PORT=465
SPRING_MAIL_USERNAME=email@domain.com # email server domain
SPRING_MAIL_PASSWORD=password  # password of email server
SPRING_MAIL_PROPERTIES_MAIL_SMTP_AUTH=true
SPRING_MAIL_PROPERTIES_MAIL_SMTP_SSL_ENABLE=true
SPRING_MAIL_PROPERTIES_MAIL_SMTP_STARTTLS_ENABLE=false

# OpenBAS IMAP Configuration
OPENBAS_MAIL_IMAP_ENABLED=true
OPENBAS_MAIL_IMAP_HOST=imap.gmail.com  # imap host
OPENBAS_MAIL_IMAP_PORT=993
OPENBAS_MAIL_IMAP_AUTH=true
OPENBAS_MAIL_IMAP_SSL_ENABLE=true
OPENBAS_MAIL_IMAP_STARTTLS_ENABLE=false

# Collector MITRE ATT&CK Configuration
COLLECTOR_MITRE_ATTACK_ID=46f3afdb-3bd3-4a7b-8125-35a53a940f90 # Replace with a valid UUIDv4

# COLLECTOR Atomic Red Team Configuration
COLLECTOR_ATOMIC_RED_TEAM_ID=14b69c4e-fc9f-42fc-bbc5-e845b6b063d3 # Replace with a valid UUIDv
%%
 
```


### Run docker compose command to start docker instance 

```console
# if docker service is  running ..... | skip this step
sudo systemctl start docker.service 

# Run docker-compose in detached
sudo docker-compose up -d

# Check for docker instance spawn
sudo docker ps -a
```


```console
# If your `docker-compose` deployment does not support `.env` files, just export all environment variables before launching the platform:
export $(cat .env | grep -v "#" | xargs)
```


# Run docker compose command to start docker instance 
```console
# if docker service is  running ..... | skip this step
sudo systemctl start docker.service 

# Run docker-compose in detached
sudo docker-compose up -d
```

# Access OpenBAS Platform
```console
# Open Browser (chrome, firefox)
http://<internal-ip or localhost or external-ip>:8080/


# Use Login and Password set in .env file

OPENBAS_ADMIN_EMAIL=admin@openbas.io   #change me
OPENBAS_ADMIN_PASSWORD=admin@123  #change me
```

