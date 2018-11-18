" Use VIM's defaults instad of VI's
set nocompatible

" tmux - window title fix
if has ("title")
    if &t_ts == "" && ( &term == "screen" || &term == "xterm" )
        let &t_ts = "\e]2;"
    endif
    if &t_ts != ""
        set title
    endif
endif

" Turns on detection, plugin and indent
filetype plugin indent on

" Enable syntax
syntax enable

" Redraw after command 'silent'
command! -nargs=+ Silent execute 'silent <args>' | redraw!

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
" PACKAGES
"-------------------------------------------------------------------------------

packadd matchit
packadd termdebug
