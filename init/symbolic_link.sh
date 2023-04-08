#!/bin/bash -eu

echo "link to .zshrc"
ln -nsf ~/dotfiles/zsh/.zshrc ~/.zshrc

echo "link to sheldon config"
mkdir -p ~/.config/sheldon && ln -nsf ~/dotfiles/zsh/sheldon/plugins.toml ~/.config/sheldon/plugins.toml

echo "link to .vimrc"
ln -nsf ~/dotfiles/.vim/.vimrc ~/.vimrc

echo "link to .ideavimrc"
ln -nsf ~/dotfiles/.vim/.ideavimrc ~/.ideavimrc

echo "link to .karabiner.json"
mkdir -p ~/.config/karabiner && ln -nsf ~/dotfiles/preferences/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
