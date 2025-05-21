#!/bin/bash

# Define the paths of the files and directories to be removed
FILES=(
  "$HOME/.zshrc"
  "$HOME/.tmux.conf"
)

FOLDERS=(
  "$HOME/.tmux"                # Folder in the home directory
  "$HOME/.oh-my-zsh"           # Folder in the home directory
  "$HOME/.config/ghostty"      # Folder in the .config directory
  "$HOME/.config/nvim"         # Folder in the .config directory
  "$HOME/.config/starship"     # Folder in the .config directory
)


# Function to safely remove files
remove_file() {
  if [ -f "$1" ] || [ -L "$1" ]; then
    echo "Removing file: $1"
    rm -r "$1"
  else
    echo "No file found: $1"
  fi
}

# Function to safely remove directories
remove_directory() {
  if [ -d "$1" ]; then
    echo "Removing directory: $1"
    rm -rf "$1"
  else
    echo "No directory found: $1"
  fi
}

# Remove files
for FILE in "${FILES[@]}"; do
  remove_file "$FILE"
done

# Remove directories
for DIR in "${FOLDERS[@]}"; do
  remove_directory "$DIR"
done

echo "Cleanup complete."


# Use stow to create symlinks for each package
cd "$HOME/dotfiles" || { echo "Failed to change directory"; exit 1; }

stow -vt ~ .

echo "Stowing complete"
