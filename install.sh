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

info "Setting up @chris3ware's dotfiles."
os="$(uname -s)"
if [ "${os}" = "Darwin" ]; then
  info "Checking for Xcode Command Line Tools..."
  if xcode-select -p >/dev/null 2>&1; then
    success "Xcode Command Line Tools are installed."
  else
    install "Xcode Command Line Tools..."
    xcode-select --install >/dev/null 2>&1
    while ! xcode-select -p >/dev/null 2>&1; do
      sleep 5
    done
    success "Xcode Command Line Tools installation complete."
  fi
fi

info "Installing chezmoi and applying dotfiles; you will be prompted for the age passphrase..."
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init \
  --persistent-state "${HOME}/.local/state/chezmoi/chezmoistate.boltdb" \
  --source "${HOME}/Developer/github.com/chris3ware/dotfiles" \
  --apply chris3ware || true
success "Dotfiles initialized and applied."
