#!/usr/bin/env bash

source "$HOME/.bin/utils/colors.sh"

info "Clearing system cache and temporary files..."

info "Cleaning up old packages..."
sudo dnf autoremove -y || {
  error "Failed to clean up packages!"
  exit 1
}

info "Cleaning unused Flatpak runtimes..."
flatpak uninstall --unused -y || {
  error "Failed to clean Flatpak runtimes!"
  exit 1
}

#cleaning thumbnail
rm -rf ~/.cache/thumbnails/* || {
  error "Failed to clean thumbnails!"
  exit 1
}

success "System cache cleared successfully!"
