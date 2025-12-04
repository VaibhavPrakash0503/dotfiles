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
  jetbrains-mono-fonts
  jetbrains-mono-nl-fonts
)

# Install Starship separately
echo ""
echo -e "${BLUE}[Installing]${NC} Starship"
if ! command -v starship &>/dev/null; then
  echo "Installing Starship..."
  curl -sS https://starship.rs/install.sh | sh -s -- -y
  print_success "Starship installed"
else
  print_warning "Starship already installed"
fi
print_separator

# Install terminal packages
for pkg in "${packages[@]}"; do
  install_dnf_package "$pkg"
done

print_section_complete "Terminal tools installation complete!"
