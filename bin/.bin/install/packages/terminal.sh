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
  tldr
)

docker=(
  docker-ce
  docker-ce-cli
  containerd.io
  docker-buildx-plugin
  docker-compose-plugin
)

# Install terminal packages
for pkg in "${packages[@]}"; do
  install_dnf_package "$pkg"
done

for pkg in "${docker[@]}"; do
  install_dnf_package "$pkg"
done

# Insallig JetBrainsMono Nerd Fornt
echo ""
echo -e "${BLUE}[Installing]${NC} JetBrainsMono Nerd Font"

if ! cd "$HOME/Downloads"; then
  print_error "Failed to change to Downloads directory. Skipping font installation."
else
  if ! wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz; then
    print_error "Failed to download fonts."
  else
    mkdir -p "$HOME/.fonts/JetBrainsMono"
    tar -xf JetBrainsMono.tar.xz -C ~/.fonts/JetBrainsMono

    rm JetBrainsMono.tar.xz
  fi
fi
print_separator

# Create .tmux/plugins folder and clone tmp
echo ""
echo -e "${BLUE}[Installing]${NC} TPM for Tmux"
mkdir -p "$HOME/.tmux/plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

print_separator

print_section_complete "Terminal tools installation complete!"
