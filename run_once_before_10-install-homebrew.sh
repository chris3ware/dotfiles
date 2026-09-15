#!/bin/sh

# Install Homebrew if it is not already installed
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || true

  # Set up Homebrew environment for the current shell session
  eval "$(/opt/homebrew/bin/brew shellenv)" || true
fi
