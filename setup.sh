#!/bin/bash -eu

xcode_select_installed=$(xcode-select -p 2>/dev/null)

if [ -z "$xcode_select_installed" ]; then
  echo "Installing Command Line Tools for Xcode..."
  xcode-select --install
  echo "Command Line Tools for Xcode installation completed."
else
  echo "Command Line Tools for Xcode are already installed."
fi

if command -v brew >/dev/null 2>&1; then
  echo "Homebrew is already installed."
else
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "eval \"$(/opt/homebrew/bin/brew shellenv)\"" >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew installation failed."
    exit 1
  fi

  brew doctor
  brew update --verbose
fi

echo "Installing chezmoi..."
brew install chezmoi

echo "Applying dotfiles..."
chezmoi init --apply https://github.com/umi8/dotfiles.git

echo "Initial setup is completed."

read -rp "Do you want to reboot the system now? (Y/N)" choice
if [[ $choice =~ ^[Yy]$ ]]; then
  echo "The system will be rebooted."
  sudo shutdown -r now
else
  echo "Please reboot the system later."
fi
