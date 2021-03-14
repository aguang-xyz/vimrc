#!/usr/bin/env bash

init_mac() {

  # Install vim8.
  brew upgrade vim

  # Install [prettier](https://github.com/prettier/prettier).
  sudo npm install -g prettier

  # Install [yapf](https://github.com/google/yapf).
  pip3 install -U yapf

  # Install [rufo](https://github.com/ruby-formatter/rufo).
  sudo gem install rufo

  # Install [pandoc](https://pandoc.org/MANUAL.html).
  brew upgrade pandoc

  # Install [clang-format](http://clang.llvm.org/docs/ClangFormat.html).
  brew upgrade clang-format

  # Install [astyle](http://astyle.sourceforge.net/).
  brew upgrade astyle

  # Install [shfmt](https://formulae.brew.sh/formula/shfmt).
  brew upgrade shfmt
}

init_linux() {

  # Install vim8.
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
    Darwin*) init_mac ;;
    Linux*) init_linux ;;
    *) unsupported ;;
  esac
}

main
