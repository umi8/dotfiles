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
alias gb='fzf-git-branch'
alias gf='git fetch'
alias gsw='fzf-git-switch'
alias gch='fzf-copy-git-commit-hash'

function fzf-git-branch() {
  git rev-parse HEAD > /dev/null 2>&1 || return

  git branch --color=always --sort=-committerdate |
    grep -v HEAD |
    fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
	  sed "s/.* //"
}

function fzf-git-switch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    git switch $branch
}

function fzf-copy-git-commit-hash() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local sha_shorten

    sha_shorten=$(git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" |
          fzf --height 50% --ansi --no-multi |
          cut -d ' ' -f 2)

    echo -n "$sha_shorten" | pbcopy
}
