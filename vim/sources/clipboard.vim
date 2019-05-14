" BASED ON: https://github.com/christoomey/vim-system-copy

let s:blockwise = 'blockwise visual'
let s:visual = 'visual'
let s:motion = 'motion'
let s:linewise = 'linewise'
let s:copy_command = 'xsel --clipboard --input'
let s:paste_command = 'xsel --clipboard --output'

function! s:system_copy(type, ...) abort
    let mode = <SID>resolve_mode(a:type, a:0)
    let unnamed = @@
    if mode == s:linewise
        let lines = { 'start': line("'["), 'end': line("']") }
        silent exe lines.start . "," . lines.end . "y"
    elseif mode == s:visual || mode == s:blockwise
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

function! s:resolve_mode(type, arg)
    let visual_mode = a:arg != 0
    if visual_mode
        return (a:type == '') ?  s:blockwise : s:visual
    elseif a:type == 'line'
        return s:linewise
    else
        return s:motion
    endif
endfunction


if has("clipboard")
    nnoremap <C-p> "+p
    nnoremap <C-y> "+y
    xnoremap <C-y> "+y
else
    xnoremap <silent> <C-y> :<C-U>call <SID>system_copy(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>
    nnoremap <silent> <C-y> :<C-U>set opfunc=<SID>system_copy<CR>g@
    nnoremap <silent> <C-y>y :<C-U>set opfunc=<SID>system_copy<Bar>exe 'norm! 'v:count1.'g@_'<CR>

    nnoremap <silent> <C-p> :<C-U>call <SID>system_paste()<CR>
endif
