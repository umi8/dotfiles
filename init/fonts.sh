#!/bin/bash -eu

if ! command -v fc-list >/dev/null 2>&1; then
  echo "fc-list is not installed. Please install it first."
  exit 1
fi

if fc-list | grep -i powerline >/dev/null; then
  echo "Powerline fonts are already installed."
  exit 0
fi

echo "Cloning Powerline fonts..."
git clone https://github.com/powerline/fonts.git --depth=1

echo "Installing Powerline fonts..."
cd fonts || exit 1
./install.sh

echo "Cleaning..."
cd .. || exit 1
rm -rf fonts

echo "Powerline Fonts installation completed."
