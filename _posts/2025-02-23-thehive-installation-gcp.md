---
layout: post
title: thehive Installation on Google Cloud Platform
date: 23-02-2025
categories: [Installation]
tags: [like,comment,subscribe]
---


# Prerequisites
```
System Requirement: 
    OS : Ubuntu 22.04 LTS (x86/64, amd64)
    Disk Size: 50 GB     # recommended more size as per your requirement 
    memory: 16 GB
    core: 4 vcpu (1 shared core)
    region : us-central1
    zone : Any
```


<div align="center">
    <img src="https://github.com/Arth2001/arth2001.github.io/blob/main/_images/23-02-2025/thehive%20img%201.png" alt="Instance Name" width ="800" >
    <p><em><b>Instance Name</b></em></p>
</div>
<div align="center">
    <img src="https://github.com/Arth2001/arth2001.github.io/blob/main/_images/23-02-2025/thehive%20img%202.png" alt="OS & Storage" width ="800" >
    <p><em><b>OS & Storage</b></em></p>
</div>



```
Networking : 
	- default interface Ipv4 (10.128.0.0/20)
	- Allow http traffic (port 80)
	-  Allow https traffic (port 443)
	- Allow Port 9000 for traffic (thehive server running .................................. )
```


<div align="center">
    <img src="https://github.com/Arth2001/arth2001.github.io/blob/main/_images/23-02-2025/thehive%20img%203.png" alt="OS & Storage" width ="800" >
    <p><em><b>Network allow traffic</b></em></p>
</div>


<div align="center">
    <img src="https://github.com/Arth2001/arth2001.github.io/blob/main/_images/23-02-2025/thehive%20img%204.png" alt="OS & Storage" width ="800" >
    <p><em><b>Network interface</b></em></p>
</div>



Now Let Create a Instance ..................................



To enable traffic on port 9000, navigate to the Firewall (VPC Network).
Create a firewall rule to allow traffic on port 9000 using the TCP protocol.

<div align="center">
    <img src="https://github.com/Arth2001/arth2001.github.io/blob/main/_images/23-02-2025/thehive%20img%205.png" alt="OS & Storage" width ="800" >
    <p><em><b>Firewall Rule Name</b></em></p>
</div>

```
Set Target & Source IPv4 Ranges
	- Target : All instances in the network
	-  Source IPv4 ranges : 0.0.0.0/0
```
<div align="center">
    <img src="https://github.com/Arth2001/arth2001.github.io/blob/main/_images/23-02-2025/thehive%20img%206.png" alt="OS & Storage" width ="800" >
    <p><em><b>Set target and Source Ipv4 </b></em></p>
</div>


```
Scroll down to Protocol and Ports
	- Check box the TCP protocol
	- write 9000 in Placeholder
```

<div align="center">
    <img src="https://github.com/Arth2001/arth2001.github.io/blob/main/_images/23-02-2025/thehive%20img%207.png" alt="OS & Storage" width ="800" >
    <p><em><b>Set Protocol & Port 9000 </b></em></p>
</div>


 Then Create Firewall rule ..................................


Let's now connect to the instance via SSH.


To update and upgrade the package repository on a Linux server, use the following commands:

```bash
# update and upgrade repository for linux server
sudo apt update && sudo apt upgrade -y
```


Let now Install the thehive in server using automate script

Visit the below link for where you can get reference 


[Automated Installation Script docs](https://example.com](https://docs.strangebee.com/thehive/installation/automated-installation-script/#using-the-installation-script )


```bash
# automate script 
wget -q -O /tmp/install.sh https://archives.strangebee.com/scripts/install.sh ; sudo -v ; bash /tmp/install.sh
```


When you execute the script, the following output will appear:


<div align="center">
    <img src="https://github.com/Arth2001/arth2001.github.io/blob/main/_images/23-02-2025/thehive%20img%208.png" alt="OS & Storage" width ="800" >
    <p><em><b>Script Execution </b></em></p>
</div>


Type : yes


The next option allows us to install TheHive and Cortex. We will choose option 2.


<div align="center">
    <img src="https://github.com/Arth2001/arth2001.github.io/blob/main/_images/23-02-2025/thehive%20img%209.png" alt="OS & Storage" width ="800" >
    <p><em><b>Script Initilization </b></em></p>
</div>



The installation process will take approximately 5 to 8 minutes to complete.


<div align="center">
    <img src="https://github.com/Arth2001/arth2001.github.io/blob/main/_images/23-02-2025/thehive%20img%2010.png" alt="OS & Storage" width ="800" >
    <p><em><b>Proccess Completion </b></em></p>
</div>



Now, let's access TheHive using the URL provided:

URL: http://<your internal or external IP>:9000



Refresh the page 1-2 times to ensure the webpage loads properly.



<div align="center">
    <img src="https://github.com/Arth2001/arth2001.github.io/blob/main/_images/23-02-2025/thehive%20img%2011.png" alt="OS & Storage" width ="800" >
    <p><em><b>thehive login page </b></em></p>
</div>


The default credentials for logging into TheHive are:

- Login: **admin@thehive.local**
- Password: **secret**



<div align="center">
    <img src="https://github.com/Arth2001/arth2001.github.io/blob/main/_images/23-02-2025/thehive%20img%2012.png" alt="OS & Storage" width ="800" >
    <p><em><b>thehive home Page </b></em></p>
</div>

Congratulations! You have successfully set up TheHive. 🎉




