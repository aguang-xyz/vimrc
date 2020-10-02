" When processing tab, insert spaces.
set expandtab

" Show existing tab with 2 spaces width.
set tabstop=2 softtabstop=2

" When indenting with '>', use 2 spaces width.
set shiftwidth=2

" Show 80 char line.
set colorcolumn=80

" Show line number.
set number

" Theme.
colorscheme industry

" Install plugins via [vim-plug](https://github.com/junegunn/vim-plug).
call plug#begin(stdpath('data') . '/plugged')

  " 1. Status line, [vim-airline](https://github.com/vim-airline/vim-airline).
  Plug 'vim-airline/vim-airline'


  " 2. Git status, [vim-gitgutter](https://github.com/airblade/vim-gitgutter).
  Plug 'airblade/vim-gitgutter'


  " 3. Start screen, [vim-startify](https://github.com/mhinz/vim-startify).
  Plug 'mhinz/vim-startify'


  " 4. File system explorer, [NERDTree](https://github.com/preservim/nerdtree).
  Plug 'preservim/nerdtree'

  " Use key '`' to toggle NERDTree.
  nmap ` :NERDTreeToggle<CR>

  " Show git status in file system explorer.
  Plug 'Xuyuanp/nerdtree-git-plugin'

  let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'~',
                \ 'Staged'    :'+',
                \ 'Untracked' :'*',
                \ 'Renamed'   :'»',
                \ 'Unmerged'  :'=',
                \ 'Deleted'   :'x',
                \ 'Dirty'     :'×',
                \ 'Ignored'   :' ',
                \ 'Clean'     :'ø',
                \ 'Unknown'   :'?',
                \ }

  " 5. Auto completion framework, [Deoplete](https://github.com/Shougo/deoplete.nvim).
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Use deoplete by default.
  let g:deoplete#enable_at_startup = 1


  " 5.1 Auto completion for Ruby.
  Plug 'fishbullet/deoplete-ruby'


  " 5.2 Auto completion for Javascript.
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

  " Include the types of the completions.
  let g:deoplete#sources#ternjs#types = 1

  " Support extra filetypes.
  let g:deoplete#sources#ternjs#filetypes = [
        \ 'jsx',
        \ 'javascript.jsx',
        \ 'vue',
        \ ]


  " 5.3 Auto completion for Python.
  Plug 'deoplete-plugins/deoplete-jedi', { 'do': 'pip3 install --user jedi' }

  " Disable type information of completions.
  let g:deoplete#sources#jedi#enable_typeinfo = 0


  " 6. Auto formatter, [neoformat](https://github.com/sbdchd/neoformat).
  Plug 'sbdchd/neoformat'

  " Enable tab to spaces conversion
  let g:neoformat_basic_format_retab = 1

  " Enable trimmming of trailing whitespace
  let g:neoformat_basic_format_trim = 1

  " Auto format on save.
  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END


  " 7. Autogenerate tags when writing HTML or XML.
  " [emmet-vim](https://github.com/mattn/emmet-vim).
  Plug 'mattn/emmet-vim'

  " Use double comma as magic key.
  let g:user_emmet_leader_key = ','


  " 8. Auto pairs, [auto-pairs](https://github.com/jiangmiao/auto-pairs).
  Plug 'jiangmiao/auto-pairs'

call plug#end()
