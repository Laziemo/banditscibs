#!/bin/bash -e
# Sets up a non sudo user for ssh entry and a root user for operations

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./setup_sudoand_ssh_users sudo_user sudo_pass ssh_key_name\nFirst two arguments are username and password for sudo user\nLast param is the ssh-key name for which the .pub will be placed in  /home/entry/.ssh/authorized_keys\n"
 exit 1
fi



sudo_user=$1
ssh_pub_key=$(cat $HOME/.ssh/$2.pub)

adduser "$sudo_user"
usermod -aG sudo "$sudo_user"
printf "Setting up user entry for ssh"
adduser entry
mkdir /home/entry/.ssh
touch /home/entry/authorized_keys
cat $ssh_pub_key >> /home/entry/authorized_keys

echo "Port 22909" >> /etc/ssh/sshd_config
echo "" >> /etc/ssh/sshd_config
echo "" >> /etc/ssh/sshd_config
echo "" >> /etc/ssh/sshd_config

echo "Access control setup complete."

