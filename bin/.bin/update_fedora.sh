#!/bin/zsh

#This script updates system and software

echo "Starting the update process..."

echo "Updating system packages..."
sudo dnf update -y || {echo "System update failed!"; exit 1;}

echo "Updating Flatpak packages..."
flatpak update -y || { echo "Flatpak update failed!"; exit 1; }

# Optionally, clean up old packages
echo "Cleaning up old packages..."
sudo dnf autoremove -y || { echo "Failed to clean up packages!"; exit 1; }

echo "Cleaning DNF cache..."
sudo dnf clean all || { echo "Failed to clean cache!"; exit 1; }

echo "Cleaning unused Flatpak runtimes..."
flatpak uninstall --unused -y || { echo "Failed to clean Flatpak runtimes!"; exit 1; }

echo "Update process complete!"
