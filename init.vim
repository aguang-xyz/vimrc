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

" Install plugins via [vim-plug](https://github.com/junegunn/vim-plug).
call plug#begin(stdpath('data') . '/plugged')
  
  " 1. Status line, [vim-airline](https://github.com/vim-airline/vim-airline).
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'


  " 2. File system explorer, [NERDTree](https://github.com/preservim/nerdtree).
  Plug 'preservim/nerdtree'

  " Use key '`' to toggle NERDTree.
  nmap ` :NERDTreeToggle<CR>


  " 3. Auto completion framework, [Deoplete](https://github.com/Shougo/deoplete.nvim).
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Use deoplete by default.
  let g:deoplete#enable_at_startup = 1


  " 3.1 Auto completion for Ruby.
  Plug 'fishbullet/deoplete-ruby'


  " 3.2 Auto completion for Javascript.
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

  " Include the types of the completions.
  let g:deoplete#sources#ternjs#types = 1

  " Support extra filetypes. 
  let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]


  " 3.3 Auto completion for Python.
  Plug 'deoplete-plugins/deoplete-jedi', { 'do': 'pip3 install --user jedi' }

  " Disable type information of completions.
  let g:deoplete#sources#jedi#enable_typeinfo = 0


  " 4. Auto formatter, [neoformat](https://github.com/sbdchd/neoformat).
  Plug 'sbdchd/neoformat'

  " Auto format on save.
  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END

call plug#end()
