# ======================
# Command Line Tools
# ======================
echo "install COmmand Line Tools for Xcode"
xcode-select --install

# ======================
# homebrew
# ======================
echo "install homebrew"
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor"
which brew >/dev/null 2>&1 && brew doctor

echo "run brwe update"
which brew >/dev/null 2>&1 && brew update --verbose

echo "run brew bundle"
which brew >/dev/null 2>&1 && brew bundle --file preferences/homebrew/Brewfile

# ======================
# Karabiner-Elements
# ======================
cp -p preferences/karabiner/karabiner.json ~/.config/karabiner/

# ======================
# font
# ======================

echo "clone Powerline fonts"
git clone https://github.com/powerline/fonts.git --depth=1

echo "install fonts"
cd fonts
./install.sh

echo "clean-up"
cd ..
rm -rf fonts

# ======================
# link
# ======================

echo "create symbolic link"

echo "link to .zshrc"
ln -sf ~/dotfiles/.zshrc ~/.zshrc
echo "link to .vimrc"
ln -sf ~/dotfiles/.vimrc ~/.vimrc
echo "link to .ideavimrc"
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc