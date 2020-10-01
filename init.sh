# 1. Install NeoVim.
sudo apt install -y neovim python-neovim python3-neovim

# 2. Link `autoload`.
NVM_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site

# 2.1 Make sure the data directory exist.
mkdir -p $NVM_DATA_DIR

# 2.2 Create soft link of `autoload` if not exists.
if [ ! -d "$NVM_DATA_DIR/autoload" ]
then
  ln -s $PWD/autoload "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
else
  echo "[WARN] Directory \`$NVM_DATA_DIR/autoload\` already exists."
fi

# 3. Link `init.vim`.
NVM_CONF_DIR="$HOME/.config/nvim"

# 3.1 Make sure the config directory exist.
mkdir -p $NVM_CONF_DIR

# 3.2 Create soft link of `init.vim` if not exists.
if [ ! -f "$NVM_CONF_DIR/init.vim" ]
then
  ln -s $PWD/init.vim $NVM_CONF_DIR/init.vim
else
  echo "[WARN] Directory \`$NVM_CONF_DIR/init.vim\` already exists."
fi
