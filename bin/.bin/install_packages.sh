#!/usr/bin/env bash

# This script installs my packages.

# Define array
packages=(
  dnf-plugins-core
  zsh
  ghostty
  kitty
  tmux
  starship
  vim
  nvim
  bat
  fzf
  fastfetch
  yazi
  stow
  discord
  vlc
  gnome-tweaks
  code
  lazygit
  qbittorrent
)

# Enable third-party repositories
echo "Enabling third-party repositories..."

# 1. Vs-code
if ! sudo dnf repolist | grep -q "code"; then
  echo "Adding VS Code repository..."
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
else
  echo "VS Code repo already enabled"
fi

# 2. Ghostty
if ! sudo dnf copr list | grep "pgdev/ghostty"; then
  echo "Enabling Ghostty COPR..."
  sudo dnf copr enable pgdev/ghostty -y
else
  echo "Ghostty COPR already enabled"
fi

# 3. yazi
if ! sudo dnf copr list | grep "lihaohong/yazi"; then
  echo "Enabling yazi COPR..."
  sudo dnf copr enable lihaohong/yazi -y
else
  echo "yazi COPR already enabled"
fi

# 4. lazygit
if ! sudo dnf repolist | grep -q "/dejan/lazygit"; then
  echo "Enabling Lazygit COPR..."
  sudo dnf copr enable dejan/lazygit -y
else
  echo "Lazygit COPR alredy enabled"
fi

# Install a package with error handling
install_package() {
  local package=$1
  echo "Installing $package..."

  if [ "$package" == "starship" ]; then
    if ! command -v starship &>/dev/null; then
      STARSHIP_INSTALL=yes curl -sS https://starship.rs/install.sh | sh
    else
      echo "Starship already installed"
    fi
  else
    if ! sudo dnf install -y "$package"; then
      echo "Error installing $package"
    else
      echo "$package installed successfully"
    fi
  fi
  echo "------------------------------"
}

#Install terminal_packages
echo "Installing packages..."
for pkg in "${packages[@]}"; do
  install_package "$pkg"
done

# Installing multimedia
echo "Installing multimedia support..."
sudo dnf -y group install multimedia
