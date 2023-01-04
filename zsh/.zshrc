ZSH_CONFS_DIR="${HOME}/dotfiles/zsh/.zsh.d"
ZSH_PRIORITIES_CONF="${ZSH_CONFS_DIR}/priorities.conf"

# Load ${ZSH_CONFS} in ${ZSH_PRIORITIES_CONF}
source "${ZSH_PRIORITIES_CONF}"

for zsh_conf in ${ZSH_CONFS}; do
  source "${ZSH_CONFS_DIR}/${zsh_conf}"
done

ZSH_SECRET_CONF="${HOME}/dotfiles/zsh/.zshrc.secret"

if [ -e "${ZSH_SECRET_CONF}" ]; then
  source "${ZSH_SECRET_CONF}"
fi
