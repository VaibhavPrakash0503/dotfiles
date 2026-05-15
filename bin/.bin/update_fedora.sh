#!/usr/bin/env bash

#This script updates system and software
DNF=false
FLATPAK=false

while getopts "df" opt; do
  case $opt in
  d) DNF=true ;;
  f) FLATPAK=true ;;
  *)
    echo "Usage: $0 [-d] [-f]"
    echo "  -d  Update system packages using DNF"
    echo "  -f  Update Flatpak packages"
    exit 1
    ;;
  esac
done

if ! $DNF && ! $FLATPAK; then
  DNF=true
  FLATPAK=true
fi
echo "Starting the update process..."

if $DNF; then
  echo "Updating system packages..."
  sudo dnf update -y || {
    echo "System update failed!"
    exit 1
  }
fi

if $FLATPAK; then
  echo -e "\nUpdating Flatpak packages..."
  flatpak update -y || {
    echo "Flatpak update failed!"
    exit 1
  }
fi

# clean up old packages via the clean.sh script
echo ""
~/.bin/clean.sh
