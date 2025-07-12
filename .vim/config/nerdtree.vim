" Use key '`' to toggle NERDTree.
nmap ` :NERDTreeToggle<CR>

" Customize git status indicatros.
let g:NERDTreeGitStatusIndicatorMapCustom = {
              \ 'Modified'  :'~',
              \ 'Staged'    :'+',
              \ 'Untracked' :'*',
              \ 'Renamed'   :'»',
              \ 'Unmerged'  :'=',
              \ 'Deleted'   :'x',
              \ 'Dirty'     :'x',
              \ 'Ignored'   :'*',
              \ 'Clean'     :'ø',
              \ 'Unknown'   :'?',
              \ }

" Show hidden files.
let g:NERDTreeShowHidden = 1
