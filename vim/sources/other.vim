" Use Vim settings
set nocompatible

" tmux - title fix
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

" Backups etc.
set backup
set backupdir=~/.vimtmp/backup/
set directory=~/.vimtmp//
set undodir=~/.vimtmp/undo/
set undofile


"-------------------------------------------------------------------------------
" PACKAGES
"-------------------------------------------------------------------------------

packadd matchit
packadd termdebug
