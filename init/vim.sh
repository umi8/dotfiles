#!/bin/bash -eu

plug_vim_path="$HOME/.vim/autoload/plug.vim"

if [ -e "${plug_vim_path}" ]; then
  echo "plug.vim is already exists."
  exit 0
fi

echo "Installing plug vim..."
curl -fLo "${plug_vim_path}" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
