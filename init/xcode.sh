#!/bin/bash -eu

xcode_select_installed=$(xcode-select -p 2>/dev/null)

if [ -z "$xcode_select_installed" ]; then
  echo "Installing Command Line Tools for Xcode..."
  xcode-select --install
  echo "Command Line Tools for Xcode installation completed."
else
  echo "Command Line Tools for Xcode are already installed."
fi
