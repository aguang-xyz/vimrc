" Auto formatter, [neoformat](https://github.com/sbdchd/neoformat).
Plug 'sbdchd/neoformat'

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Use key '=' to format current file.
nmap = :Neoformat<CR>

let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_cs = ['astyle']
let g:neoformat_enabled_ruby = ['rufo']
