#!/bin/bash -e
# Sets up a non sudo user for ssh entry and a root user for operations

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./setup_sudo_and_ssh_users <sudo_user_name> \nFirst argument is admin username \n\n"
 exit 1
fi



sudo_user=$1

adduser "$sudo_user"
usermod -aG sudo "$sudo_user"

printf "Setting up user entry for ssh"
adduser entry
mkdir /home/entry/.ssh
touch /home/entry/authorized_keys
nano /home/entry/authorized_keys

nano /etc/ssh/sshd_config
#echo "Port 22909" >> /etc/ssh/sshd_config
#echo "PermitRootLogin false" >> /etc/ssh/sshd_config
#echo "" >> /etc/ssh/sshd_config
#echo "" >> /etc/ssh/sshd_config

echo "Access control setup complete."

