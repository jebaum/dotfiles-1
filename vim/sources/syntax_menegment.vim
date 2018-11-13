
"-----------------------------------------------------------------------------
" INDENTATION RULES
"-----------------------------------------------------------------------------
set autoindent    " Enable automatic indenting
set cindent       " Automatic C program indenting
set expandtab     " Use spaces instead of tabs
set shiftround    " Always indent/outdent to the nearest tabstop
set shiftwidth=4  " Indent/outdent by 4 columns
set smartindent   " Smart indention
set softtabstop=4 " Unify tabs and spaces
set tabstop=4     " Tab spacing


"-----------------------------------------------------------------------------
" FOLDING
"-----------------------------------------------------------------------------

" Languages
autocmd FileType javascript setlocal foldmethod=syntax

" Normally -- DO NOT SORT!!
autocmd BufReadPre * setlocal foldmethod=indent
autocmd BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif

" 'set'
set foldlevel=10
set foldnestmax=10
set nofoldenable
