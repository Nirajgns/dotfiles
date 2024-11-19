# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

#for starship
show_newline() {
  if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
    NEW_LINE_BEFORE_PROMPT=1
  # elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
  #   echo ""
  fi
}
PROMPT_COMMAND="show_newline"
eval "$(starship init bash)" #for starship

#binary paths
export PATH="$PATH:/home/niraj/developmemt/flutter/bin"
export ANDROID_HOME=$HOME/android
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH
export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH
export PATH=~/.cargo/bin/:$PATH
export PATH="$PATH:/opt/nvim-linux64/bin"

#aliases
alias cls='clear'
alias nv='neovide'
alias tma='tmux attach'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
