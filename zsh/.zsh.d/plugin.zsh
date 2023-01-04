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
