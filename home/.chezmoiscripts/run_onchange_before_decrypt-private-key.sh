#!/bin/sh

set -eu

GREEN='\033[32m'
NC='\033[0m'

success() {
  printf "${GREEN}[OK]${NC} %s\n" "$*"
}

# Decrypt the private key for chezmoi if it doesn't exist
# Must be run before any other chezmoi commands
if [ ! -f "${HOME}/.config/chezmoi/key.txt" ]; then
  mkdir -p "${HOME}/.config/chezmoi"
  PATH="${HOME}/.local/bin:${PATH}"
  export PATH
  chezmoi age decrypt --output "${HOME}/.config/chezmoi/key.txt" --passphrase "${HOME}/Developer/github.com/chris3ware/dotfiles/assets/key.txt.age" || exit 1
  chmod 600 "${HOME}/.config/chezmoi/key.txt"
  success "chezmoi age key decrypted and secured."
fi
