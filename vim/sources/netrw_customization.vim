autocmd VimEnter,TabEnter * let t:NetrwIsOpen=0

function! ToggleNetrw()
    if t:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout! " . i
            endif
            let i-=1
        endwhile
        let t:NetrwIsOpen=0
    else
        let t:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction


augroup netrw_autocmd
    autocmd!
    autocmd filetype netrw set nolist
    autocmd filetype netrw nnoremap <buffer> <F1> gT
    autocmd filetype netrw setlocal statusline=NETRW
augroup END


" VARIABLES --------------------------------------------------------------------

" Absolute width of netrw window
let g:netrw_winsize = -28

" Do not display info on the top of window
let g:netrw_banner = 0

" Tree-view
let g:netrw_liststyle = 3

" Sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" Use the previous window to open file
let g:netrw_browse_split = 4

" Do not show hidden files
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'

let g:netrw_altv = 1

" OTHER ------------------------------------------------------------------------

noremap <silent> <F4> :call ToggleNetrw()<CR>

autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' | q | endif
