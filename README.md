# Fedora Workstation

This repository contains my personal configuration files and setup scripts for various tools, ensuring a consistent setup across different Fedora machines.

## What This Repo Does

- Automatically installs all required packages (shell, terminal, tools, fonts, etc.) on Fedora via DNF
- Sets up configuration files using GNU Stow to create symlinks
- Provides a reproducible environment for Zsh, Neovim (LazyVim), Tmux, Kitty/Ghostty, and more

You do **not** need to install any prerequisites manually. The `install.sh` script will handle installing all necessary packages (Zsh, Tmux, Kitty, Ghostty, Neovim, Starship, bat, fzf, yazi, stow, JetBrains Mono Nerd Font, etc.) on your Fedora system.

## Included Configurations

- **Zsh** (`~/.zshrc`)
- **Tmux** (`~/.tmux.conf`)
- **Neovim (LazyVim)** (`~/.config/nvim`)
- **Kitty Terminal** (`~/.config/kitty`)
- **Ghostty Terminal** (`~/.config/ghostty`)
- **Starship** (`~/.config/starship.toml`)
- **Custom Scripts** (`~/.bin`)

## Installation

1. Clone this repository to your home directory:

```
git clone https://github.com/VaibhavPrakash0503/dotfiles.git ~/dotfiles
cd ~/dotfiles/bin/.bin/install
./install.sh
```

## Setup Symlinks

2. Setup Symlinks to config files.

```
cd ..
./setup_symlinks.sh
```

Restart your terminal for all changes to take effect.

## Notes

- **Fedora-specific**: This setup is designed and tested for Fedora Linux
- The scripts are idempotent where possible, so you can re-run them when setting up new machines
- Review `install.sh` and `setup_symlinks.sh` if you want to customize which tools or configs are applied.
