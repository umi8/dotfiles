# Enable colors
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


# -----------------
# aliases
# ----------------

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias ~='cd ~'
alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
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

# Path to Intellij IDEA Command-line
export PATH=/usr/local/bin/idea:$PATH

