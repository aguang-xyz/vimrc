Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Auto completion framework, [Deoplete](https://github.com/Shougo/deoplete.nvim).
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Use deoplete by default.
let g:deoplete#enable_at_startup = 1


" Auto completion for Ruby.
Plug 'fishbullet/deoplete-ruby'


" Auto completion for Javascript.
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Include the types of the completions.
let g:deoplete#sources#ternjs#types = 1

" Support extra filetypes.
let g:deoplete#sources#ternjs#filetypes = [
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'vue',
      \ ]


" Auto completion for Python.
Plug 'deoplete-plugins/deoplete-jedi', { 'do': 'pip3 install --user jedi' }

" Disable type information of completions.
let g:deoplete#sources#jedi#enable_typeinfo = 0


" Auto completion for C#.
Plug 'OmniSharp/omnisharp-vim'


" Auto completion for Typescript.
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
