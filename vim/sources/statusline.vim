"-------------------------------------------------------------------------------
" FUNCTIONS
"-------------------------------------------------------------------------------

function! FileSize()
    let bytes = getfsize(expand(@%))
    if (bytes >= 1024*1024)
        return '~' . float2nr(round(bytes/(1024*1024.0))) . ' MiB'
    elseif (bytes >= 1024)
        return '~' . float2nr(round(bytes/1024.0)) . ' KiB'
    elseif (bytes <= 0)
        return '0 B'
    else
        return bytes . ' B'
    endif
endfunction

function! ALE_Status() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '' : printf(
    \   ' Errors: %d | Warnings: %d ',
    \   all_errors,
    \   all_non_errors
    \)
endfunction


"-------------------------------------------------------------------------------
" STATUS LINE
"-------------------------------------------------------------------------------

set statusline=
set statusline+=[%n]                                                                           " Buffer number
set statusline+=\ \                                                                            " Separator
set statusline+=%f\                                                                            " Relative path to the file
set statusline+=\                                                                              " Separator
set statusline+=%y                                                                             " Filetype
set statusline+=[%{&ff}]                                                                       " File format
set statusline+=[%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"\ BOM\":\"\")}]  " File encoding
set statusline+=\ \                                                                            " Separator
set statusline+=[%{&fo}]                                                                       " Format options
set statusline+=\ \                                                                            " Separator
set statusline+=[%{FileSize()}]                                                                " File size
set statusline+=\ \                                                                            " Separator
set statusline+=%r                                                                             " Readonly flag
set statusline+=%w                                                                             " Preview flag
set statusline+=\ \                                                                            " Separator
set statusline+=%m                                                                             " Modified flag
set statusline+=%=                                                                             " Switch to the right side
set statusline+=%#StatuslineError#                                                       " Syntastic Statusline Highlight
set statusline+=%{ALE_Status()}
set statusline+=%*                                                                             " Back to normal 'StatusLine' highlight
set statusline+=\ \                                                                            " Separator
set statusline+=[0x%B]                                                                         " Value of character under cursor in hex
set statusline+=\ \ \|\ \                                                                      " Separator
set statusline+=%l/                                                                            " Current line
set statusline+=%L                                                                             " Total lines
set statusline+=\ \:\ %c\                                                                      " Current column
