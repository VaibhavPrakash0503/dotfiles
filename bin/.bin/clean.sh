#!/usr/bin/env bash

echo "Clearing system cache and temporary files..."

echo "Cleaning up old packages..."
sudo dnf autoremove -y || { echo "Failed to clean up packages!"; exit 1; }

echo "Cleaning unused Flatpak runtimes..."
flatpak uninstall --unused -y || { echo "Failed to clean Flatpak runtimes!"; exit 1; }

#cleaning thumbnail
rm -rf ~/.cache/thumbnails/*

echo "Cleaning journal logs..."
sudo journalctl --vacuum-time=7d
echo "System cache cleared successfully!"
