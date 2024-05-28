#!/bin/bash

# Function to update and upgrade Debian-based systems
update_debian() {
    echo "Updating package list..."
    sudo apt update

    echo "Upgrading installed packages..."
    sudo apt upgrade -y

    echo "Cleaning up unnecessary packages..."
    sudo apt autoremove -y
    sudo apt clean

    echo "Debian-based system update completed."
}

# Function to update and upgrade Red Hat-based systems
update_redhat() {
    echo "Updating package list..."
    sudo yum check-update

    echo "Upgrading installed packages..."
    sudo yum update -y

    echo "Cleaning up unnecessary packages..."
    sudo yum autoremove -y
    sudo yum clean all

    echo "Red Hat-based system update completed."
}

# Detect the OS and call the appropriate function
if [ -f /etc/debian_version ]; then
    echo "Debian-based system detected."
    update_debian
elif [ -f /etc/redhat-release ]; then
    echo "Red Hat-based system detected."
    update_redhat
else
    echo "Unsupported OS. Please run this script on a Debian-based or Red Hat-based system."
    exit 1
fi

echo "System update and upgrade process completed."
