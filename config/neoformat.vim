" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimming of trailing white spaces
let g:neoformat_basic_format_trim = 1

" Use key '=' to format current file.
nmap = :Neoformat<CR>

" TODO: Enable formatter for more languages.
let g:neoformat_enabled_c = ['clang-format']
let g:neoformat_enabled_cpp = ['clang-format']
let g:neoformat_enabled_cs = ['astyle']
let g:neoformat_enabled_ruby = ['rufo']

