# dotfiles

## What's configured

- Git
- Homebrew
- iTerm2
- Karabiner-Elements
- mac
- Vim
- zsh

## Installation

### 1. dotfilesの適用（chezmoi）

```sh
brew install chezmoi
chezmoi init --apply https://github.com/umi8/dotfiles.git
```

これにより、このリポジトリは chezmoi の標準ソースディレクトリ `~/.local/share/chezmoi` に配置され、`home/` 配下の設定ファイルが対応するホームディレクトリ上のパスに適用される。

### 2. マシン固有の機密ファイルを配置する（chezmoi管理対象外）

以下は git 管理・chezmoi管理のいずれにも含まれない、マシンごとに手動で用意するファイル。

- `~/.zshrc.secret` — マシン固有の環境変数やaliasなど
- `~/.local/bin/` — `aws-mfa` 以外の個人用スクリプト（旧 `bin/.secret/` 配下のスクリプト）

以前 `~/dotfiles` を使っていた環境から移行する場合は、`~/dotfiles/zsh/.zshrc.secret` を `~/.zshrc.secret` に、`~/dotfiles/bin/.secret/` 配下のスクリプトを `~/.local/bin/` に、それぞれ手動でコピーすること。

### 3. OSセットアップ（Homebrew・Xcode Command Line Tools・フォント等）

```sh
cd ~/.local/share/chezmoi && \
source install.sh
```
