#!/bin/zsh

echo "Clearing system cache and temporary files..."

sudo dnf clean all

#cleaning thumbnail
rm -rf ~/.cache/thumbnails/*

echo "System cache cleared successfully!"
