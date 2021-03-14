" File system explorer, [NERDTree](https://github.com/preservim/nerdtree).
Plug 'preservim/nerdtree'

" Use key '`' to toggle NERDTree.
nmap ` :NERDTreeToggle<CR>

" Show git status in file system explorer.
Plug 'Xuyuanp/nerdtree-git-plugin'

" Customize git status indicatros.
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

" Show hidden files.
let g:NERDTreeShowHidden = 1
