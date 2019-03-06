" Fill rest of line with characters
function! s:FillLine(str)
    .s/[[:space:]]*$//
    let reps = (g:textwidth - col("$")) / len(a:str)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction

" Repeats given string
function! s:RepeatStr(times, str)
    execute ":normal a" . repeat(a:str, a:times)
endfunction

" Toggle cursorline's underline
function s:CursorHighlightToggle()
    setlocal cursorcolumn!
    if (g:CursorHighlight_state == 1)
        hi CursorLine cterm=none ctermbg=none
        let g:CursorHighlight_state = 0
    else
        hi CursorLine cterm=none ctermbg=235
        let g:CursorHighlight_state = 1
    endif
    echo
endfunction


" NECESSARY VARIABLES ----------------------------------------------------------

let g:CursorHighlight_state = 0
let g:textwidth             = 80


" CALLING COMMANDS -------------------------------------------------------------

command! -nargs=+ FillLine call <SID>FillLine('<args>')
command! -nargs=+ RepeatStr call <SID>RepeatStr(<f-args>)


" MAPPINGS ---------------------------------------------------------------------

map <F3> :call <SID>CursorHighlightToggle()<CR>
