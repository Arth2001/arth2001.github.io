---
layout: post
title: OpenCTI Installation on Google Cloud Platform
date: 03-02-2025
categories: [Installation]
tags: [like,comment,subscribe]
---




# Prerequisites
```console
System Requirement: 
	OS : Ubuntu 24.04 LTS (x86/64, amd64)
	Disk Size: 30 GB     # recommended more size as per your requirement 
	memory: 16 GB
	core: 4 vcpu (1 shared core)
	Networking: 
		Allow port 80 # http traffic
		Allow port 8080
		Allow port 443 # https traffic
```

# Access SSH Instance
```console
sudo ssh -i /path/to/privatekey username@external-ip
```


# Create and password user for OpenCTI

```console
# created user and directory for username
sudo useradd -m -d /home/opencti opencti

# passwd for user
sudo passwd opencti 


# Assign specific shell for user
sudo usermod -s /bin/bash opencti


# Add user into sudo groups 
sudo usermod -aG sudo opencti   # For sudo permission


# change user 
su opencti


# change directory
cd /home/opencti
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

# Clone OPENCTI Repository
```console
# check the file name .env.sample, rename it to .env in sample directory where you have clone the repo.
sudo cp .env.sample .env

# open file .env with nano command
sudo nano .env

# Copy content of file and Paste :
%%
OPENCTI_ADMIN_EMAIL=admin@opencti.io
OPENCTI_ADMIN_PASSWORD=admin@123
OPENCTI_ADMIN_TOKEN=b122b5a2-901a-4112-9d50-9f5a2487df7c
OPENCTI_BASE_URL=http://<internal-ip>:8080
OPENCTI_HEALTHCHECK_ACCESS_KEY=4f1607f3-9c26-416a-afe2-fb4a6632d54f
MINIO_ROOT_USER=opencti
MINIO_ROOT_PASSWORD=admin@123
RABBITMQ_DEFAULT_USER=opencti
RABBITMQ_DEFAULT_PASS=admin@123
CONNECTOR_EXPORT_FILE_STIX_ID=dd817c8b-abae-460a-9ebc-97b1551e70e6
CONNECTOR_EXPORT_FILE_CSV_ID=7ba187fb-fde8-4063-92b5-c3da34060dd7
CONNECTOR_EXPORT_FILE_TXT_ID=ca715d9c-bd64-4351-91db-33a8d728a58b
CONNECTOR_IMPORT_FILE_STIX_ID=72327164-0b35-482b-b5d6-a5a3f76b845f
CONNECTOR_IMPORT_DOCUMENT_ID=c3970f8a-ce4b-4497-a381-20b7256f56f0
CONNECTOR_ANALYSIS_ID=4dffd77c-ec11-4abe-bca7-fd997f79fa36
SMTP_HOSTNAME=localhost
ELASTIC_MEMORY_SIZE=4G
%%
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

# Access OpenCTI Platform
```console
# Open Browser (chrome, firefox)
http://<internal-ip or localhost or external-ip>:8080/


# Use Login and Password set in .env file

OPENBAS_ADMIN_EMAIL=admin@opencti.io   #change me
OPENBAS_ADMIN_PASSWORD=admin@123  #change me
```









