" BASED ON: https://github.com/christoomey/vim-system-copy

let s:blockwise = 'blockwise visual'
let s:visual = 'visual'
let s:motion = 'motion'
let s:linewise = 'linewise'

function! s:system_copy(type, ...) abort
    let visual_mode = a:0 != 0
    if visual_mode
        let mode = (a:type == '') ?  s:blockwise : s:visual
    elseif a:type == 'line'
        let mode = s:linewise
    else
        let mode = s:motion
    endif
    let unnamed = @@
    if mode == s:linewise
        let lines = { 'start': line("'["), 'end': line("']") }
        silent exe lines.start . "," . lines.end . "y"
    elseif mode == s:visual || mode == s:blockwise
        silent exe "normal! `<" . a:type . "`>y"
    else
        silent exe "normal! `[v`]y"
    endif
    let command = 'xclip -sel clipboard'
    " TODO exceptions
    silent call system(command, getreg('@'))
    let @@ = unnamed
endfunction


if has("clipboard")
    map <C-p> "+p
    map <C-y> "+y
else
    " Paste
    map <C-p> :execute "normal! a".system('xclip -sel clipboard -o')<CR>

    " Copy visual selection
    xnoremap <silent> <C-y> :<C-U>call <SID>system_copy(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>

    " Copy line
    nnoremap <silent> <C-y>y :<C-U>set opfunc=<SID>system_copy<Bar>exe 'norm! 'v:count1.'g@_'<CR>

    " Copy other
    nnoremap <silent> <C-y> :<C-U>set opfunc=<SID>system_copy<CR>g@
endif
