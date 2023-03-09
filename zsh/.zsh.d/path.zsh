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
export PATH="$HOME/dotfiles/bin/.secret:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
