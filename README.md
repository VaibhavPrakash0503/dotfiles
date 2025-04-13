# My Config Backup

This repository contains my personal configuration files for various tools, ensuring a consistent setup across different machines.

## Prerequisites

Before using this configuration, install the required tools:

- **Zsh** (Shell)
- **Tmux** (Terminal Multiplexer)
- **Kitty** (Terminal Emulator)
- [Ghostty](https://ghostty.org/docs/install/binary#linux-(official)) (Terminal Emulator)
- **Martian Mono Nerd Font** (Terminal font)
- **Neovim** (Text Editor)
- **Oh My Zsh** (Zsh Framework)
- [Starship](https://starship.rs/installing/) (Terminal prompt)
- [NvChad](https://nvchad.com/docs/quickstart/install) (neovim configuration)
- **bat** (Similar to cat used in preview for fzf)
- [fzf](https://github.com/junegunn/fzf?tab=readme-ov-file#linux-packages) (Fuzzy finder)
- [yazi](https://yazi-rs.github.io/docs/installation) (Terminal File manager)
- **stow** (Used to symlink the config fiels easily)
## Included Configurations

- **Tmux** (`.tmux.conf`)
- **Neovim (NvChad)** (`~/.config/nvim`)
- **Kitty Terminal** (`~/.config/kitty`)
- **Ghostty Terminal** (`~/.config/ghostty`)
- **Starship** (`~/.config/starship.toml`)
- **Zsh + Oh My Zsh** (`.zshrc`, `.oh-my-zsh`)
- **Custom Scripts** (`~/.bin`)

## Installation

1. Clone this repository to your home directory
2. Run the setup-symlinks.sh to stow the configs.
3. Restart your terminal for changes to take effect.


This ensures that your configurations are backed up and easily restorable on any machine.

