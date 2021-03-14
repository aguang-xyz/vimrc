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

" Use system clipboard.
set clipboard+=unnamedplus

" Theme.
colorscheme industry

" Auto pairs, [auto-pairs](https://github.com/jiangmiao/auto-pairs).
Plug 'jiangmiao/auto-pairs'

" Fency start screen, [vim-startify](https://github.com/mhinz/vim-startify)
Plug 'mhinz/vim-startify'

" Git support, [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive).
" Support some commands like:
"   :G commit
"   :G blame
"   :G diff
Plug 'tpope/vim-fugitive'
