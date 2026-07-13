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

### 1. セットアップ（Xcode Command Line Tools・Homebrew・chezmoi・dotfilesの適用）

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/umi8/dotfiles/master/setup.sh)"
```

これにより、Xcode Command Line Tools・Homebrew・chezmoi がインストールされ、このリポジトリが chezmoi の標準ソースディレクトリ `~/.local/share/chezmoi` に配置され、`home/` 配下の設定ファイルが対応するホームディレクトリ上のパスに適用される。続けて zsh補完のパーミッション調整・vim-plugの導入・mac defaultsの適用・Powerlineフォントの導入が自動的に行われる。

### 2. マシン固有の機密ファイルを配置する（chezmoi管理対象外）

以下は git 管理・chezmoi管理のいずれにも含まれない、マシンごとに手動で用意するファイル。

- `~/.zshrc.secret`: マシン固有の環境変数やaliasなど
- `~/.local/bin/`: `aws-mfa` 以外の個人用スクリプト（旧 `bin/.secret/` 配下のスクリプト）

以前 `~/dotfiles` を使っていた環境から移行する場合は、`~/dotfiles/zsh/.zshrc.secret` を `~/.zshrc.secret` に、`~/dotfiles/bin/.secret/` 配下のスクリプトを `~/.local/bin/` に、それぞれ手動でコピーすること。
