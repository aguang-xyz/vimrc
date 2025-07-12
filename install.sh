#!/usr/bin/env bash

function install_vim_plugin() {
  id="${1}"
  dir="~/.vim/pack/vendor/start/$(basename "${id}")"
  repo="https://github.com/${id}.git"
  if [[ -d "${dir}" ]]; then
    git -C "${dir}" pull
  else
    git clone "${repo}" "${dir}"
  fi
  echo ""
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

install_mac() {

  # Install vim plugins.
  install_vim_plugins

  # Install vim.
  brew install vim

  # Install [prettier](https://github.com/prettier/prettier).
  sudo npm install -g prettier

  # Install [yapf](https://github.com/google/yapf).
  pip3 install -U yapf

  # Install [rufo](https://github.com/ruby-formatter/rufo).
  sudo gem install rufo

  # Install [pandoc](https://pandoc.org/MANUAL.html).
  brew install pandoc

  # Install [clang-format](http://clang.llvm.org/docs/ClangFormat.html).
  brew install clang-format

  # Install [astyle](http://astyle.sourceforge.net/).
  brew install astyle

  # Install [shfmt](https://formulae.brew.sh/formula/shfmt).
  brew install shfmt
}

install_linux() {

  # Install vim plugins.
  install_vim_plugins

  # Install vim.
  sudo apt install vim

  # Install [prettier](https://github.com/prettier/prettier).
  npm install -g prettier

  # Install [yapf](https://github.com/google/yapf).
  pip3 install -U yapf

  # Install [rufo](https://github.com/ruby-formatter/rufo).
  gem install rufo

  # Install [pandoc](https://pandoc.org/MANUAL.html).
  sudo apt install -y pandoc

  # Install [clang-format](http://clang.llvm.org/docs/ClangFormat.html).
  sudo apt install -y clang-format

  # Install [astyle](http://astyle.sourceforge.net/).
  sudo apt install astyle

  # Install [shfmt](https://snapcraft.io/install/shfmt/ubuntu).
  sudo snap install shfmt

}

unsupported() {
  echo "Unsupported system"
  exit 1
}

main() {
  unameOutput="$(uname -s)"
  case "${unameOutput}" in
  Darwin*) install_mac ;;
  Linux*) install_linux ;;
  *) unsupported ;;
  esac
}

main
