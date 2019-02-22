" Preview of Vim 256 colors
function! Color_demo()
    30 vnew
    setlocal nonumber buftype=nofile bufhidden=hide noswapfile
    setlocal statusline=[%n]
    setlocal statusline+=\ Color\ demo
    let num = 255
    while num >= 0
        exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
        exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
        call append(0, 'ctermbg='.num.':....')
        let num = num - 1
    endwhile
endfunction

" Check highlight group under the cursor
function! WhatHighlishtItIs()
    echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction

" View ex command result in a scratch buffer
function! Scratch (command, ...)
    redir => lines
    let saveMore = &more
    set nomore
    execute a:command
    redir END
    let &more = saveMore
    call feedkeys("\<cr>")
    new | setlocal buftype=nofile bufhidden=hide noswapfile
    put=lines
    if a:0 > 0
        execute 'vglobal/'.a:1.'/delete'
    endif
    if a:command == 'scriptnames'
        %substitute#^[[:space:]]*[[:digit:]]\+:[[:space:]]*##e
    endif
    silent %substitute/\%^\_s*\n\|\_s*\%$
    let height = line('$') + 3
    execute 'normal! z'.height."\<cr>"
    0
endfunction
