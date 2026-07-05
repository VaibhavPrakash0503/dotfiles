#!/usr/bin/env bash

#This script updates system and software
DNF=false
FLATPAK=false

check_updates() {
  echo "Checking for system updates..."
  sudo dnf check-update || {
    echo "Failed to check for system updates!"
    exit 1
  }

  printf "\nChecking for Flatpak updates..."
  flatpak remote-ls --updates || {
    echo "Failed to check for Flatpak updates!"
    exit 1
  }

  printf "\nChecking for firmware updates..."
  sudo fwupdmgr get-updates
  local fw_exit=$?
  if [[ $fw_exit -ne 0 && $fw_exit -ne 2 ]]; then
    echo "Failed to check for firmware updates!"
    exit 1
  fi

  exit 0
}

while [[ $# -gt 0 ]]; do
  case $1 in
  -d)
    DNF=true
    shift
    ;;
  -f)
    FLATPAK=true
    shift
    ;;
  -c)
    check_updates
    ;;
  -fr)
    sudo fwupdmgr update || {
      echo "Firmware update failed!"
      exit 1
    }
    exit 0
    ;;
  *)
    echo "unrecognized option '$1'"
    echo "Usage: update [-d] [-f]"
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
if [ -x ~/.bin/clean.sh ]; then
  echo "Cleaning up old packages..."
  ~/.bin/clean.sh
fi
