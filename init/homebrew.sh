#!/bin/bash -eu

if command -v brew >/dev/null 2>&1; then
  echo "Homebrew is already installed."
  exit 0
fi

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Check for problems with Homebrew settings and dependencies
brew doctor
# Update Homebrew repository
brew update --verbose
# Install packages
brew bundle --file preferences/homebrew/Brewfile

echo "Homebrew installation completed."
