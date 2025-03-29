# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_CONFS_DIR="${HOME}/dotfiles/zsh/.zsh.d"
ZSH_PRIORITIES_CONF="${ZSH_CONFS_DIR}/priorities.conf"

# Load ${ZSH_CONFS} in ${ZSH_PRIORITIES_CONF}
source "${ZSH_PRIORITIES_CONF}"

for zsh_conf in ${ZSH_CONFS}; do
  source "${ZSH_CONFS_DIR}/${zsh_conf}"
done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ZSH_SECRET_CONF="${HOME}/dotfiles/zsh/.zshrc.secret"

if [ -e "${ZSH_SECRET_CONF}" ]; then
  source "${ZSH_SECRET_CONF}"
fi
