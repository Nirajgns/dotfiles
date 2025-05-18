# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ----- History & Keybindings -----
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -e
bindkey '^p' fzf-history-widget
bindkey '^n' fzf-history-widget

setopt appendhistory
setopt inc_append_history
setopt sharehistory
setopt auto_cd
setopt correct
setopt extended_glob
setopt hist_ignore_dups
setopt hist_reduce_blanks

# ----- Completion -----
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
if [[ -n "${ZDOTDIR:-$HOME}/.zcompdump"(N.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# ----- Aliases -----
alias nv='neovide --fork'
alias ls='ls --color'

# ----- Brew setup -----
if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  if [[ ! -f ~/.zprofile_brew ]]; then
    /home/linuxbrew/.linuxbrew/bin/brew shellenv > ~/.zprofile_brew
  fi
  source ~/.zprofile_brew
fi

# ----- Zinit install -----
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}Zinit…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# ----- Plugins -----
zinit wait'0' lucid for \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-syntax-highlighting \
  Aloxaf/fzf-tab \
  ajeetdsouza/zoxide \
  zsh-users/zsh-completions \
  joshskidmore/zsh-fzf-history-search \
  unixorn/fzf-zsh-plugin \
  hlissner/zsh-autopair

# zinit ice depth=1; zinit light romkatv/powerlevel10k
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


# ----- FZF binary check -----
if [[ ! -f ~/.fzf_warning_shown && ! -x "$(command -v fzf)" ]]; then
  echo "⚠️ Install fzf (brew install fzf / apt install fzf) for fzf-tab to work best."
  touch ~/.fzf_warning_shown
fi

# ----- Lazy-load nvm -----
export NVM_DIR="$HOME/.nvm"
nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

