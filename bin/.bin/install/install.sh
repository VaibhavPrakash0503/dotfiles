#!/usr/bin/env bash

set -e # exit on error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Scorce helper functions
source "$SCRIPT_DIR/helpers.sh"

print_header "Starting Installation Process"

# Enable repository

print_section "Setting up repositories"
bash $SCRIPT_DIR/repos/vscode.sh
bash $SCRIPT_DIR/repos/coprs.sh
bash $SCRIPT_DIR/repos/flatpak.sh

# Install packages
print_section "Installing packages"
bash $SCRIPT_DIR/packages/terminal.sh
bash $SCRIPT_DIR/packages/devlopment.sh
bash $SCRIPT_DIR/packages/desktop.sh

# Install flatpak apps
print_section "Installing flatpak applications"
bash $SCRIPT_DIR/packages/flatpak.sh

print_header "Installation Complete!"
