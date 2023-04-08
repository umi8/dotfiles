#!/bin/bash -eu

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
