#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/../helpers.sh"

# Ensure Flatpak is installed
if ! command -v flatpak &>/dev/null; then
  echo "Installing Flatpak..."
  sudo dnf install -y flatpak
fi

# Add Flathub repository
if ! flatpak remotes | grep -q "flathub"; then
  echo "Adding Flathub repository..."
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  print_success "Flathub repository added"
else
  print_warning "Flathub already configured"
fi
