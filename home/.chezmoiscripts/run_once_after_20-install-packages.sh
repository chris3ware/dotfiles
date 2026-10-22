#!/bin/sh

set -eu

CYAN='\033[36m'
BLUE='\033[34m'
GREEN='\033[32m'
NC='\033[0m'

info() {
  printf "${CYAN}[INFO]${NC} %s\n" "$*"
}

install() {
  printf "${BLUE}[RUN]${NC} %s\n" "$*"
}

success() {
  printf "${GREEN}[OK]${NC} %s\n" "$*"
}

if [ -x /opt/homebrew/bin/brew ]; then
  brew_env="$(/opt/homebrew/bin/brew shellenv)"
  eval "${brew_env}"
  info "Homebrew environment configured."
  # Make sure any configuration files created on package installation respect XDG_CONFIG_HOME
  export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
  install "packages from Brewfile..."
  brew bundle --file="${HOME}/Developer/github.com/chris3ware/dotfiles/Brewfile"
  success "Homebrew packages installed."
fi
