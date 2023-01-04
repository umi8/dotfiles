ZSH_D_DIR="${HOME}/dotfiles/zsh/.zsh.d"

zsh_d_list=($(find "${ZSH_D_DIR}/"*.zsh -type f | awk -F '/' '{ print $NF }' | sort))
source "${ZSH_D_DIR}/priorities.conf"
zsh_confs=$(printf "%s\n" "${ZSH_CONFS[@]}" | sort)

invaders=$(echo ${zsh_d_list[@]} ${zsh_confs[@]} | tr ' ' '\n' | sort | uniq -u | tr '\n' ' ')

if test -n "${invaders}"; then
  echo "Not managed in ${ZSH_D_DIR}/priorities.conf: ${invaders}"
fi
