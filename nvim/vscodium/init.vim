set spell spelllang=en_us

""""""""""""""""""""""""""""""""""""""
" Display numbers of lines
""""""""""""""""""""""""""""""""""""""
set nu

"""""""""""""""""""""""""""""""""""""""""""
" Copy-paste between vim & everything else
"""""""""""""""""""""""""""""""""""""""""""
set clipboard+=unnamedplus   

""""""""""""""""""""""""""""""""""""""
" Turn on syntax
""""""""""""""""""""""""""""""""""""""
syntax enable
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""
" Maximum textwidth and highlight limit
""""""""""""""""""""""""""""""""""""""
set colorcolumn=80
set textwidth=80

""""""""""""""""""""""""""""""""""""""
" Map leader to ccedilla
""""""""""""""""""""""""""""""""""""""
let mapleader = "ç"

""""""""""""""""""""""""""""""""""""""
" Tabs using 4 spaces
""""""""""""""""""""""""""""""""""""""
" NOTE: Call after loading coc plugin
" set tabstop=8 -> changed to print tab lines 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab