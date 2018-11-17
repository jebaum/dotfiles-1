" Fill rest of line with characters
function! FillLine( str )
    let tw = &textwidth
    if tw==0 | let tw = 80 | endif
    .s/[[:space:]]*$//
    let reps = (tw - col("$")) / len(a:str)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction

" Preview of Vim 256 colors
function! Color_demo()
    30 vnew
    setlocal nonumber
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


" CALLING COMMANDS -------------------------------------------------------------
command! -nargs=+ FillLine call FillLine('<args>')
