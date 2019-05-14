autocmd BufReadPre * setlocal foldmethod=indent
autocmd BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif

set foldlevel=10
set foldnestmax=10
set nofoldenable


" FOLDING RULES FOR LANGUAGES --------------------------------------------------

" C/C++/Java
function! s:OutlineToggle()
    let OldLine = line(".")
    let OldCol = virtcol(".")
    if (! exists ("b:outline_mode"))
        let b:outline_mode = 0
        let b:OldMarker = &foldmarker
    endif
    if (b:outline_mode == 0)
        let b:outline_mode = 1
        set foldmethod=marker
        set foldmarker={,}
        silent! exec "%s/{{{/{<</"
        silent! exec "%s/}}}/}>>/"
    else
        let b:outline_mode = 0
        set foldmethod=marker
        let &foldmarker=b:OldMarker
        silent! exec "%s/{<</{{{/"
        silent! exec "%s/}>>/{{{/"
    endif
    execute "normal! ".OldLine."G"
    execute "normal! ".OldCol."|"
    unlet OldLine
    unlet OldCol
    execute "normal! zv"
endfunction
autocmd VimEnter x call <SID>OutlineToggle()

" JavaScript
autocmd FileType javascript setlocal foldmethod=syntax
