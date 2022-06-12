# -----------------
# zplug
# -----------------

if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  source ~/.zplug/init.zsh

  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-completions"
  zplug "chrissicool/zsh-256color"
  zplug "b4b4r07/enhancd", use:init.sh
  zplug "romkatv/powerlevel10k", as:theme, depth:1
   
  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
      printf "Install? [y/N]: "
      if read -q; then
          echo; zplug install
      fi
  fi
  
  # Then, source plugins and add commands to $PATH
  zplug load

  if zplug check b4b4r07/enhancd; then
    #ISABLE change parent directory FOR ENHANCD
    export ENHANCD_DISABLE_DOT=1
  fi

fi

# -----------------
# Completion
# -----------------
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit && compinit -u
fi
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''
setopt list_packed           # 補完候補を詰めて表示
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt magic_equal_subst     # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt complete_in_word      # 語の途中でもカーソル位置で補完
setopt extended_glob         # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)

# -----------------
# aliases
# -----------------

alias v='vim'
alias vz='vim ~/.zshrc'
alias sz='source ~/.zshrc'

alias ..='cd ..'
alias ls='lsd'
alias ll='ls -ltra'
alias cat='bat'

# git
alias g='git'
alias gs='git status'
alias gb='git branch'
alias gf='git fetch'

# -----------------
# anyenv
# -----------------

eval "$(anyenv init -)"
eval "$(pyenv init -)"
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
eval "$(rbenv init - zsh)"

# -----------------
# path
# -----------------

# Path to Intellij IDEA Command-line
export PATH=/usr/local/bin/idea:$PATH

# Path to Go bin
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH

# Path to nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Path to Glassfish
export GLASSFISH_HOME=/usr/local/opt/glassfish/libexec

export PATH="$HOME/dotfiles/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
