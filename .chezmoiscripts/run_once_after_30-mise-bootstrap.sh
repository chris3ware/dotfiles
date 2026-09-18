#!/bin/sh

if command -v mise >/dev/null 2>&1; then
  echo "Running mise bootstrap..."
  mise bootstrap
fi
