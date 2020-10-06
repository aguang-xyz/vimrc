# 1. Install NeoVim.
sudo apt install -y neovim python-neovim python3-neovim

# 2. Link `autoload`.
NVM_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site

# 2.1 Make sure the data directory exist.
mkdir -p $NVM_DATA_DIR

# 2.2 Create soft link of `autoload` if not exists.
if [ ! -d "$NVM_DATA_DIR/autoload" ]; then
  ln -s $PWD/autoload ${NVM_DATA_DIR}/autoload
else
  echo "[WARN] Directory \`$NVM_DATA_DIR/autoload\` already exists."
fi

# 3. Link `init.vim`.
NVM_CONF_DIR="$HOME/.config/nvim"

# 3.1 Make sure the config directory exist.
mkdir -p $NVM_CONF_DIR

# 3.2 Create soft link of `init.vim` if not exists.
if [ ! -f "$NVM_CONF_DIR/init.vim" ]; then
  ln -s $PWD/init.vim $NVM_CONF_DIR/init.vim
else
  echo "[WARN] Directory \`$NVM_CONF_DIR/init.vim\` already exists."
fi

# 4. Install formatters.

# 4.1 Install [prettier](https://github.com/prettier/prettier).
npm install -g prettier

# 4.2 Install [yapf](https://github.com/google/yapf).
pip3 install -U yapf

# 4.3 Install [rufo](https://github.com/ruby-formatter/rufo).
gem install rufo

# 4.4 Install [pandoc](https://pandoc.org/MANUAL.html).
sudo apt install -y pandoc

# 4.5 Install [clang-format](http://clang.llvm.org/docs/ClangFormat.html).
sudo apt install -y clang-format

# 4.6 Install [astyle](http://astyle.sourceforge.net/).
sudo apt install astyle

# 4.7 Install [shfmt](https://snapcraft.io/install/shfmt/ubuntu).
sudo snap install shfmt
