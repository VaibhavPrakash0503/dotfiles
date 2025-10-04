#!/usr/bin/env bash

#This script updates system and software

echo "Starting the update process..."

echo "Updating system packages..."
sudo dnf update -y || {
  echo "System update failed!"
  exit 1
}

echo -e "\nUpdating Flatpak packages..."
flatpak update -y || {
  echo "Flatpak update failed!"
  exit 1
}

# clean up old packages via the clean.sh script
echo ""
./.bin/clean.sh
