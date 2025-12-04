#!/usr/bin/env bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_header() {
  echo -e "\n${BLUE}========================================${NC}"
  echo -e "${BLUE}$1${NC}"
  echo -e "${BLUE}========================================${NC}\n"
}

print_section() {
  echo ""
  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${GREEN}>>> $1${NC}"
  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
}

print_error() {
  echo -e "${RED}Error: $1${NC}"
}

print_success() {
  echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
  echo -e "${YELLOW}⚠ $1${NC}"
}

print_separator() {
  echo -e "${CYAN}----------------------------------------${NC}"
}

print_section_complete() {
  echo ""
  echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${GREEN}✓✓✓ $1 ✓✓✓${NC}"
  echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
}

# Install a DNF package with error handling
install_dnf_package() {
  local package=$1
  echo ""
  echo -e "${BLUE}[Installing]${NC} $package"

  if sudo dnf install -y "$package"; then
    print_success "$package installed"
  else
    print_error "Failed to install $package"
    return 1
  fi
  print_separator
}

# Install a Flatpak with error handling
install_flatpak() {
  local app_id=$1
  local app_name=$2

  echo ""
  echo -e "${BLUE}[Installing]${NC} $app_name"

  if flatpak list | grep -q "$app_id"; then
    print_warning "$app_name already installed"
    return 0
  fi

  if flatpak install -y flathub "$app_id"; then
    print_success "$app_name installed"
  else
    print_error "Failed to install $app_name"
    return 1
  fi
  print_separator
}

# Check if repo exists
repo_enabled() {
  local repo_name=$1
  sudo dnf repolist | grep -q "$repo_name"
}

# Check if COPR exists
copr_enabled() {
  local copr_name=$1
  sudo dnf copr list | grep -q "$copr_name"
}
