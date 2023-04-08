# ======================
# Command Line Tools
# ======================
echo "install Command Line Tools for Xcode"
xcode-select --install

# ======================
# homebrew
# ======================
echo "install homebrew"
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "run brew doctor"
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update"
which brew >/dev/null 2>&1 && brew update --verbose

echo "run brew bundle"
which brew >/dev/null 2>&1 && brew bundle --file preferences/homebrew/Brewfile

# ======================
# Karabiner-Elements
# ======================
mkdir ~/.config/karabiner
ln -sf ~/dotfiles/preferences/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

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
# PATH
# ======================
export PATH=$HOME/dotfiles/bin:$PATH

# ======================
# Completion
# ======================
chmod 755 /usr/local/share/zsh/site-functions
chmod 755 /usr/local/share/zsh
chmod 755 /usr/local/share

# ======================
# anyenv
# ======================
anyenv install --init

# ======================
# vim
# ======================
echo "Install plug.vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ======================
# link
# ======================

echo "create symbolic link"

echo "link to .zshrc"
ln -nsf ~/dotfiles/zsh/.zshrc ~/.zshrc
echo "link to sheldon config"
mkdir -p ~/.config/sheldon && ln -nsf ~/dotfiles/zsh/sheldon/plugins.toml ~/.config/sheldon/plugins.toml
echo "link to .vimrc"
ln -nsf ~/dotfiles/.vimrc ~/.vimrc
echo "link to .ideavimrc"
ln -nsf ~/dotfiles/.ideavimrc ~/.ideavimrc
