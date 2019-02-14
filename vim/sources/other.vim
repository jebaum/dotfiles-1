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

" Toggle cursorline's underline
let g:hl_state=0
function CursorHighlightToggle()
    setlocal cursorcolumn!
    if (g:hl_state == 1)
        hi CursorLine cterm=none ctermbg=none
        let g:hl_state = 0
    else
        hi CursorLine cterm=none ctermbg=235
        let g:hl_state = 1
    endif
endfunction
map <F3> :call CursorHighlightToggle()<CR>

"-------------------------------------------------------------------------------
" PACKAGES
"-------------------------------------------------------------------------------

packadd matchit
packadd termdebug
