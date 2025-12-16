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

# Create .tmux/plugins folder and clone tmp
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

print_separator
print_section_complete "Terminal tools installation complete!"
