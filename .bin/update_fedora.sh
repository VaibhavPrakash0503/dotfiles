#!/bin/zsh

#This script updates system and software

echo "Starting the update process..."
echo "Updating system packages..."

sudo dnf update -y || {echo "System update failed!"; exit 1;}

# Optionally, clean up old packages
echo "Cleaning up old packages..."

sudo dnf autoremove -y || { echo "Failed to clean up packages!"; exit 1; }

echo "Cleaning cache and memory"
sudo dnf clean all || { echo "Failed to clean cache!"; exit 1; }

echo "Update process complete!"
