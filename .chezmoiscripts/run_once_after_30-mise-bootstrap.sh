#!/bin/sh

set -eu

RED='\033[31m'
CYAN='\033[36m'
BLUE='\033[34m'
GREEN='\033[32m'
YELLOW='\033[33m'
NC='\033[0m'

fail() {
  printf "${RED}[FAIL]${NC} %s\n" "$*" >&2
  exit 1
}

info() {
  printf "${CYAN}[INFO]${NC} %s\n" "$*"
}

install() {
  printf "${BLUE}[RUN]${NC} %s\n" "$*"
}

success() {
  printf "${GREEN}[OK]${NC} %s\n" "$*"
}

warn() {
  printf "${YELLOW}[WARN]${NC} %s\n" "$*"
}

# Each chezmoi script is its own process; Homebrew's PATH is not inherited so must be set explicitly.
if [ -x /opt/homebrew/bin/brew ]; then
  brew_env="$(/opt/homebrew/bin/brew shellenv)"
  eval "${brew_env}"
fi

info "Checking mise..."
if command -v mise >/dev/null 2>&1; then
  install "Running mise bootstrap..."
  if mise bootstrap; then
    success "mise bootstrap completed."
  else
    fail "mise bootstrap failed."
  fi
else
  warn "mise is not installed; skipping mise bootstrap."
fi
