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

info "Checking for Homebrew..."
if command -v brew >/dev/null 2>&1; then
  success "Homebrew is already installed."
else
  install "Homebrew..."
  installer="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  /bin/bash -c "${installer}"
  success "Homebrew installation complete."
fi
