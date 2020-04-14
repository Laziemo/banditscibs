#!/bin/bash
#This script is run as soon as your droplet/instance is created at your first login as root.
#Sets up a non sudo user for ssh entry and a root user for operations

echo "Choose a name for your sudo user"
read sudo_user
adduser "$sudo_user"
usermod -aG sudo "$sudo_user"


echo "Creating non-sudo user 'entry' for ssh access."
echo "Use ssh-keygen, and paste the .pub in the authorized_keys file."

adduser entry
mkdir /home/entry/.ssh

while true; do
    read -p "You will now be directed to the authorized key files for ssh access to user entry. Run ssh-kegen on your localhost system and copy the .pub key and paste it in here, cool? " yn
    case $yn in
        [Yy]* ) nano /home/entry/.ssh/authorized_keys; break;;
        [Nn]* ) echo "k";exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Disable root login."
while true; do
    read -p "You will now be directed to the sshd_config file. Get in there and disable root login, cool?" yn
    case $yn in
        [Yy]* ) nano /etc/ssh/sshd_config; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# nano /home/entry/.ssh/authorized_keys
#ssh-keygen on your local system, add .pub to authorized_keys

echo "Access control setup complete."

