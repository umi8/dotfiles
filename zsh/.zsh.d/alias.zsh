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
alias gba='fzf-git-branch-all'
alias gf='git fetch'
alias gsw='fzf-git-switch'
alias gswa='fzf-git-switch-all'
alias gch='fzf-copy-git-commit-hash'
alias grb='fzf-git-remove-branch'

function fzf-git-branch() {
  git rev-parse HEAD >/dev/null 2>&1 || return

  git branch --color=always --sort=-committerdate |
    grep -v HEAD |
    fzf --height 50% --ansi --no-multi --preview-window right:65% \
      --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
    sed "s/.* //"
}

function fzf-git-branch-all() {
  git rev-parse HEAD >/dev/null 2>&1 || return

  git branch -a --color=always --sort=-committerdate |
    grep -v HEAD |
    fzf --height 50% --ansi --no-multi --preview-window right:65% \
      --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
    sed "s/.* //"
}

function fzf-git-switch() {
  git rev-parse HEAD >/dev/null 2>&1 || return

  local branch
  branch=$(fzf-git-branch)

  if [[ "$branch" = "" ]]; then
    echo "No branch selected."
    return
  fi

  branch=${branch#"remotes/origin/"}
  git switch "$branch"
}

function fzf-git-switch-all() {
  git rev-parse HEAD >/dev/null 2>&1 || return

  local branch
  branch=$(fzf-git-branch-all)

  if [[ "$branch" = "" ]]; then
    echo "No branch selected."
    return
  fi

  branch=${branch#"remotes/origin/"}
  git switch "$branch"
}

function fzf-copy-git-commit-hash() {
  git rev-parse HEAD >/dev/null 2>&1 || return

  local sha_shorten

  sha_shorten=$(git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" |
    fzf --height 50% --ansi --no-multi |
    cut -d ' ' -f 2)

  echo -n "$sha_shorten" | pbcopy
}

function fzf-git-remove-branch() {
  git rev-parse HEAD >/dev/null 2>&1 || return

  local branches selected_branches
  branches=$(git branch --color=always --sort=-committerdate | grep -v -E '^(  master|  develop)')
  selected_branches=$(echo "$branches" | fzf --multi \
    --ansi \
    --preview-window right:65% \
    --preview "git log -n 50 --color=always --date=short --pretty='format:%C(auto)%cd %h%d %s'")

  local branch_array=()
  while IFS= read -r line; do
    branch_array+=("$line")
  done <<<"$selected_branches"
  num_selected=${#branch_array[@]}
  echo "$num_selected branches selected."

  for v in "${branch_array[@]}"; do
    v=$(echo "$v" | sed 's/\x1b\[[0-9;]*m//g' | sed 's/^ *//')
    git branch -D "$v"
  done
}
