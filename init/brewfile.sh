#!/bin/bash -eu

BREWFILE=~/dotfiles/preferences/homebrew/Brewfile

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Please install it first."
  exit 1
fi

if [ ! -f "${BREWFILE}" ]; then
    echo "Brewfile does not exist."
    exit 1
fi

# Install packages
brew bundle --file "${BREWFILE}"
