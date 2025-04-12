#!/bin/bash

# === Path Setup ===
HOME_DIR="$HOME"
CONFIG_DIR="$HOME/my-configs"
CONFIG_DOTCONFIG="$CONFIG_DIR/.config"

echo "🔁 Copying everything from $CONFIG_DIR to $HOME_DIR (excluding .config)"

# === 1. Copy Top-Level Files & Folders (excluding .config) ===
shopt -s dotglob  # Include dotfiles like .bashrc
for item in "$CONFIG_DIR"/*; do
  name=$(basename "$item")

  # Skip the .config directory
  if [[ "$name" == ".config" ]]; then
    continue
  fi

  dst="$HOME_DIR/$name"

  if [ -d "$item" ]; then
    mkdir -p "$dst"
    cp -r "$item/"* "$dst/" 2>/dev/null || true
    echo "📁 Copied folder $name → $dst"
  else
    cp "$item" "$dst"
    echo "🧾 Copied file $name → $dst"
  fi
done
shopt -u dotglob

# === 2. Copy .config Files & Folders ===
echo "📦 Copying configs from .config to $HOME_DIR/.config"
mkdir -p "$HOME_DIR/.config"

for item in "$CONFIG_DOTCONFIG"/*; do
  name=$(basename "$item")
  dst="$HOME_DIR/.config/$name"

  if [ -d "$item" ]; then
    mkdir -p "$dst"
    cp -r "$item/"* "$dst/" 2>/dev/null || true
    echo "📁 Copied .config folder $name → $dst"
  else
    cp "$item" "$dst"
    echo "🧾 Copied .config file $name → $dst"
  fi
done

echo "✅ All config files and folders successfully copied to your HOME and .config!"

