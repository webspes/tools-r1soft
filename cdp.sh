#!/bin/bash
# Remember to change the YOURDOMAIN.COM to your backup-server - manual job
# Script will grab latest recovery agent and put it in recovery mode on any desktop Ubuntu

# Add the R1Soft repository
echo "deb http://repo.r1soft.com/apt stable main" >> /etc/apt/sources.list

# Download and add the R1Soft key
wget http://repo.r1soft.com/r1soft.asc
apt-key add r1soft.asc

# Update the repositories and install the R1Soft agent
apt-get update -y
apt-get install r1soft-cdp-enterprise-agent -y

# Create a .recovery-mode file (assuming it's a marker for some purpose)
touch /usr/sbin/r1soft/.recovery-mode

# Set up R1Soft with the specified key
r1soft-setup --get-key https://YOURDOMAIN.COM

/etc/init.d/cdp-agent restart

# Check the status of the cdp-agent
/etc/init.d/cdp-agent status

echo "\n====== IP-ADRESSE ======"
# Display the IP address of the system
hostname -I

echo "\n====== DISKER ======"
# Iterate through all disks
lsblk -l -o NAME,SIZE | awk '$2+0 >= 10 && $2 ~ /G$/'
echo "\n"
