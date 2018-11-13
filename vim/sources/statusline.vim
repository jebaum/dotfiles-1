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


"-------------------------------------------------------------------------------
" STATUS LINE
"-------------------------------------------------------------------------------

set statusline=
set statusline+=[%n]                                                                          " Buffer number
set statusline+=\ \                                                                           " Separator
set statusline+=%f\                                                                           " Relative path to the file
set statusline+=\                                                                             " Separator
set statusline+=%y                                                                            " Filetype
set statusline+=[%{&ff}]                                                                      " File format
set statusline+=[%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"\ BOM\":\"\")}] " File encoding
set statusline+=\ \                                                                           " Separator
set statusline+=[%{FileSize()}]                                                               " File size
set statusline+=\ \                                                                           " Separator
set statusline+=%r                                                                            " Readonly flag
set statusline+=%w                                                                            " Preview flag
set statusline+=\ \                                                                           " Separator
set statusline+=%m                                                                            " Modified flag
set statusline+=%=                                                                            " Switch to the right side
set statusline+=%l/                                                                           " Current line
set statusline+=%L                                                                            " Total lines
set statusline+=\ \:\ %c\                                                                     " Current column
