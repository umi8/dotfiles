#!/bin/bash -eu

if command -v brew >/dev/null 2>&1; then
  echo "Homebrew is already installed."
  exit 0
fi

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew installation failed."
  exit 1
fi

echo "eval \"$(/opt/homebrew/bin/brew shellenv)\"" >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Check for problems with Homebrew settings and dependencies
brew doctor
# Update Homebrew repository
brew update --verbose

BREWFILE=~/dotfiles/preferences/homebrew/Brewfile
if [ ! -f "${BREWFILE}" ]; then
    echo "Brewfile does not exist."
    exit 1
fi

# Install packages
brew bundle --file "${BREWFILE}"

echo "Homebrew installation completed."
