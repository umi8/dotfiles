# -----------------
# prompt
# -----------------

# Enable colors
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# -----------------
# Completion
# -----------------
autoload -U compinit
compinit

# -----------------
# aliases
# -----------------

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias ~='cd ~'
alias -- -='cd -'

# vim
alias v='vim'
alias vz='vim ~/.zshrc'

alias ls='ls -AFG'
alias ll='ls -hlt'

# git
alias g='git'
alias ga='git add '''
alias gs='git status'
alias gct='git commit'
alias gd='git diff'
alias gl='git log'
alias gb='git branch'
alias gc='git checkout'
alias gf='git fetch'

alias sz='source ~/.zshrc'

# -----------------
# path
# -----------------

# Path to Intellij IDEA Command-line
export PATH=/usr/local/bin/idea:$PATH

# Path to Go bin
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH

export PATH="$HOME/dotfiles/bin:$PATH"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/hiromi-furukawa/.sdkman"
[[ -s "/Users/hiromi-furukawa/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/hiromi-furukawa/.sdkman/bin/sdkman-init.sh"
eval "$(anyenv init -)"
