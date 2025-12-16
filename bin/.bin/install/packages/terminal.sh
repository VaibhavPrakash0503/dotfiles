#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/../helpers.sh"

packages=(
  zsh
  ghostty
  kitty
  tmux
  vim
  bat
  fzf
  fastfetch
  yazi
  stow
  scrcpy
  starship
  jetbrains-mono-fonts
  jetbrains-mono-nl-fonts
)

# Install Starship separately
echo ""
# Install terminal packages
for pkg in "${packages[@]}"; do
  install_dnf_package "$pkg"
done

print_section_complete "Terminal tools installation complete!"
