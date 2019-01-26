" Use VIM's defaults instad of VI's
set nocompatible

" Turns on detection, plugin and indent
filetype plugin indent on

" Enable syntax
syntax enable

" Quit QuickFix window along with source file window
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix" | q | endif

" QuickFix window below other windows
autocmd FileType qf wincmd J

" Open file at the last known position
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exec "normal! g`\"" | endif

" Disable continuation of comments to the next line (yes, it cannot be just '-cro')
autocmd FileType * set fo-=c fo-=r fo-=o

" Trim trailing whitespace
autocmd BufWritePre * silent! undojoin | %s/\s\+$//e | %s/\(\n\r\?\)\+\%$//e

"-------------------------------------------------------------------------------
" INDENTATION RULES
"-------------------------------------------------------------------------------

set autoindent    " Enable automatic indenting
set cindent       " Automatic C program indenting
set expandtab     " Use spaces instead of tabs
set shiftround    " Always indent/outdent to the nearest tabstop
set shiftwidth=4  " Indent/outdent by 4 columns
set smartindent   " Smart indention
set softtabstop=4 " Unify tabs and spaces
set tabstop=4     " Tab spacing

"-------------------------------------------------------------------------------
" PACKAGES
"-------------------------------------------------------------------------------

" packadd matchit
" packadd termdebug
