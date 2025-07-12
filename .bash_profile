# Silence system warning of upgrading to zsh on macOS.
# see: https://support.apple.com/en-us/102360
export BASH_SILENCE_DEPRECATION_WARNING=1

function load_env() {

  # brew.
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # fzf.
  eval "$(fzf --bash)"

  # nvm.
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  # rust.
  . "$HOME/.cargo/env"
}

function enable_color_if_supports() {

  # Exit early if terminal does not support at least 8 colors.
  if [[ $(tput colors 2>/dev/null || echo 0) -lt 8 ]]; then
    return
  fi

  # Enable color for ls (macOS and Linux).
  if [[ "$OSTYPE" == "darwin"* ]]; then
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    alias ls='ls -G'
  else
    alias ls='ls --color=auto'
  fi

  # Enable color for grep.
  alias grep='grep --color=auto'

  # Enable color for git.
  git config --global color.ui auto

  # Enable color for man pages.
  export LESS_TERMCAP_mb=$'\E[1;31m'
  export LESS_TERMCAP_md=$'\E[1;36m'
  export LESS_TERMCAP_me=$'\E[0m'
  export LESS_TERMCAP_se=$'\E[0m'
  export LESS_TERMCAP_so=$'\E[1;44;33m'
  export LESS_TERMCAP_ue=$'\E[0m'
  export LESS_TERMCAP_us=$'\E[1;32m'
}

function load_shortcuts() {

  alias l='ls -CF'         # List with quick compact view
  alias la='ls -lA'        # List all except . and ..
  alias ..='cd ..'         # Go up one directory
  alias ...='cd ../..'     # Go up two directories
  alias ....='cd ../../..' # Go up three directories
  alias c='clear'          # Clear screen
  alias h='history'        # Show history

  alias gs='git status'
  alias ga='git add .'
  alias gc='git commit -m'
  alias gp='git push'
  alias gl='git pull'
  alias gco='git checkout'
  alias gb='git branch'
  alias gd='git diff'
  alias gcl='git clone'
  alias gcp='git cherry-pick'

}

##############################################################################

load_env
enable_color_if_supports
load_shortcuts

