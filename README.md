# tools-r1soft
Script to run on Ubuntu or similar to prepare a new machine to restore a full server to using Bare Metal Recovery (BMR).

When run with "sh cdp.sh" (you need sudo-rights if you don't have, use sudo -i before running this script), it will work for 1-3 minutes settings things up. Then it will run some commands I have found usefull to avoid manual commands.

Once ready, it will display the IP-address (if DHCP) you can restore to, along with the name of the disks available on the system. Just to make things a tiny bit easier when trying to restore.
