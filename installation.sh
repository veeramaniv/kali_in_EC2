#!/bin/bash

# Prompt the user for their username
read -p "Enter the username: " username

# Update the system
sudo apt-get update -y

# Install Xfce4 GUI and xrdp
sudo apt install xfce4 xfce4-goodies xrdp -y

# Create a new user and add them to the xrdp group
sudo adduser $username
sudo usermod -aG xrdp $username

# Add the newly created user to the sudoers group
sudo usermod -aG sudo $username

# Start RDP services
sudo systemctl enable xrdp
sudo systemctl start xrdp
sudo systemctl start xrdp-sesman

# Install default packages
sudo apt update
sudo apt full-upgrade -y
sudo apt install -y kali-linux-default kali-tweaks

echo "Installation and configuration completed!"
