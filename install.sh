#!/usr/bin/env bash

# Exit immediately if any command fails.
set -e

function install_brew() {

  if command -v brew >/dev/null 2>&1; then
    echo "✅ Homebrew is already installed at $(which brew)"
    return
  fi

  echo "📦 Homebrew not found. Installing..."

  # Run the official Homebrew installation script
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for current shell session
  echo '🔧 Adding Homebrew to PATH...'
  if [[ "$(uname -m)" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  echo "✅ Homebrew is installed successfully"
}

function install_brew_package() {
  id="${1}"
  echo "📦 Checking brew package ${id} ..."
  brew install --quiet ${id}
  echo "✅ Brew package ${id} is installed successfully"
}

function install_vim_plugin() {

  id="${1}"
  dir="${HOME}/.vim/pack/vendor/start/$(basename "${id}")"
  repo="https://github.com/${id}.git"

  if [[ -d "${dir}" ]]; then
    echo "📦 VIM package ${id} is already cloned at ${dir}. Pulling..."
    git -C "${dir}" pull >/dev/null 2>&1
  else
    echo "📦 VIM package ${id} is not cloned. Cloning..."
    git clone --quiet "${repo}" "${dir}"
  fi

  echo "✅ VIM package ${id} is installed successfully"
}

function install_vim_plugins() {

  # LSP.
  # see [vim-lsp](https://github.com/prabirshrestha/vim-lsp)
  # see [vim-lsp-settings](https://github.com/mattn/vim-lsp-settings)
  install_vim_plugin "prabirshrestha/vim-lsp"
  install_vim_plugin "mattn/vim-lsp-settings"

  # Auto complete.
  # see [asyncomplete](https://github.com/prabirshrestha/asyncomplete.vim)
  # see [asyncomplete-lsp](https://github.com/prabirshrestha/asyncomplete-lsp.vim)
  install_vim_plugin 'prabirshrestha/asyncomplete.vim'
  install_vim_plugin 'prabirshrestha/asyncomplete-lsp.vim'

  # Auto pairs.
  # see [auto-pairs](https://github.com/jiangmiao/auto-pairs).
  install_vim_plugin "jiangmiao/auto-pairs"

  # Auto formatter.
  # see [neoformat](https://github.com/sbdchd/neoformat).
  install_vim_plugin "sbdchd/neoformat"

  # File system explorer.
  # see: [NERDTree](https://github.com/preservim/nerdtree).
  install_vim_plugin "preservim/nerdtree"

  # Show git status in file system explorer.
  # see: [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
  install_vim_plugin "Xuyuanp/nerdtree-git-plugin"

  # Spell checking.
  # see: [spelunker](https://github.com/kamykn/spelunker.vim).
  install_vim_plugin "kamykn/spelunker.vim"

  # Git support.
  # see: [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive).
  # Support some commands like:
  #   :G commit
  #   :G blame
  #   :G diff
  install_vim_plugin "tpope/vim-fugitive"

  # Fancy start screen.
  # see: [vim-startify](https://github.com/mhinz/vim-startify).
  install_vim_plugin "mhinz/vim-startify"
}

function install_nvm() {

  # Check if NVM is already installed
  if [ -d "$HOME/.nvm" ] && [ -s "$HOME/.nvm/nvm.sh" ]; then
    echo "✅ NVM is already installed."
  else
    echo "📦 NVM not found. Installing..."

    # Install NVM via official script
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

    echo "✅ NVM installation script executed."
  fi

  # Ensure nvm is available in the current shell
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  # Confirm it's now available
  if command -v nvm >/dev/null 2>&1; then
    echo "✅ NVM is ready to use."
  else
    echo "❌ NVM installation completed, but not available in this shell. Try restarting your terminal."
    exit 1
  fi
}

function install_npm_package() {
  id="${1}"
  echo "📦 Checking NPM package ${id} ..."
  sudo npm install -g prettier
  echo "✅ NPM package ${id} is installed successfully"
}

function install_apple_terminal_theme() {

  theme_file="$1"

  if [[ -z "${theme_file}" || ! -f "${theme_file}" ]]; then
    echo "Usage: $0 path/to/theme.terminal"
    exit 1
  fi

  # Open the theme file to import it into Apple Terminal.
  open "${theme_file}"

  # Wait for macOS to register the new theme.
  sleep 2

  # Extract the theme name from the file (basename without extension).
  theme_name=$(basename "${theme_file}" .terminal)

  # Set as default and startup theme using `defaults`
  defaults write com.apple.Terminal "Default Window Settings" -string "${theme_name}"
  defaults write com.apple.Terminal "Startup Window Settings" -string "${theme_name}"

  echo "✅ Theme '${theme_name}' has been set as the default Terminal theme"
}

function copy_bash_profile() {
  cp -f ./.bash_profile ${HOME}/.bash_profile
  echo "✅ ${HOME}/.bash_profile has been updated"
  source ${HOME}/.bash_profile
}

function copy_vim_profile() {
  cp -R -f ./.vim ${HOME}/.vim
  echo "✅ ${HOME}/.vim has been updated"
}

function install_darwin() {

  install_brew
  install_brew_package astyle
  install_brew_package clang-format
  install_brew_package fzf
  install_brew_package pandoc
  install_brew_package shfmt
  install_brew_package yapf
  install_brew_package vim

  copy_vim_profile
  install_vim_plugins

  install_nvm
  nvm use --lts
  install_npm_package prettier

  copy_bash_profile

  install_apple_terminal_theme "./themes/Gruvbox Dark.terminal"
}

function install_linux() {

  sudo apt install -y astyle
  sudo apt install -y clang-format
  sudo apt install -y pandoc
  sudo apt install -y shfmt
  sudo apt install -y yapf3
  sudo apt install -y vim

  copy_vim_profile
  install_vim_plugins

  install_nvm
  nvm use --lts
  npm install -g prettier

  copy_bash_profile
}

function unsupported() {
  echo "Unsupported system"
  exit 1
}

function main() {
  case "$(uname -s)" in
  Darwin*) install_darwin ;;
  Linux*) install_linux ;;
  *) unsupported ;;
  esac
}

main
