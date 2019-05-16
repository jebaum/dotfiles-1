let s:copy_command  = 'xsel --clipboard --input'
let s:paste_command = 'xsel --clipboard --output'

function! s:system_copy(type, ...) abort
    let visual_mode = a:0 != 0
    if visual_mode
        let mode = (a:type == '') ?  'blockwise visual' : 'visual'
    elseif a:type == 'line'
        let mode = 'linewise'
    else
        let mode = 'motion'
    endif
    let unnamed = @@
    if mode == 'linewise'
        let lines = { 'start': line("'["), 'end': line("']") }
        silent exe lines.start . "," . lines.end . "y"
    elseif mode == 'visual' || mode == 'blockwise visual'
        silent exe "normal! `<" . a:type . "`>y"
    else
        silent exe "normal! `[v`]y"
    endif
    let command = s:copy_command
    silent call system(command, getreg('@'))
    let @@ = unnamed
endfunction

function! s:system_paste() abort
    let lines = system('xsel --clipboard --output | wc -l')
    if lines == 0
        execute "normal! a".system(s:paste_command)
    else
        put = system(s:paste_command)
    endif
endfunction

" ------------------------------------------------------------------------------

if has("clipboard")
    nnoremap <C-p> "+p
    nnoremap <C-y> "+y
    xnoremap <C-y> "+y
    command AllToClipboard execute "normal! gg\"+yG``"
else

    " Paste
    nnoremap <silent> <C-p> :call <SID>system_paste()<CR>

    " Normal copy
    nnoremap <silent> <C-y>  :set opfunc=<SID>system_copy<CR>g@

    " Copy line
    nnoremap <silent> <C-y>y :set opfunc=<SID>system_copy<Bar>exe 'norm! 'v:count1.'g@_'<CR>

    " Copy in Visual mode
    xnoremap <silent> <C-y>  :call <SID>system_copy(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>

    command AllToClipboard execute "normal! gg:set opfunc=<SID>system_copy<CR>g@G``"

endif
