"-------------------------------------------------------------------------------
" FIX FOR CursorLine BACKGROUND HIGHLIGHT AND OTHER BG HIGHLIGHTS
"-------------------------------------------------------------------------------

" List of highlight groups needing to be reversed
let groupList = ['Todo']

function ReverseHighlights(groupList)
    for group in a:groupList
        let output = execute('hi '.group)
        let s:ctermfg2 = matchstr(output, 'ctermfg=\zs\S*')
        let s:ctermbg2 = matchstr(output, 'ctermbg=\zs\S*')
        if (s:ctermfg2 == "")
            exe "hi ".group." cterm=reverse ctermfg=".s:ctermbg2." ctermbg=0"
        elseif (s:ctermbg2 == "")
            exe "hi ".group." cterm=reverse ctermfg=0 ctermbg=".s:ctermfg2
        else
            exe "hi ".group." cterm=reverse ctermfg=".s:ctermbg2." ctermbg=".s:ctermfg2
        endif
    endfor
endfunction
call ReverseHighlights(groupList)

" Not workin propely even with ReverseHighlights
hi SpellBad cterm=reverse ctermfg=9 ctermbg=0


"-------------------------------------------------------------------------------
" tmux - WINDOW TITLE FIX
"-------------------------------------------------------------------------------

if has ("title")
    if &t_ts == "" && ( &term == "screen" || &term == "xterm" )
        let &t_ts = "\e]2;"
    endif
    if &t_ts != ""
        set title
    endif
endif


"-------------------------------------------------------------------------------
" 1-liners
"-------------------------------------------------------------------------------

" Redraw after command 'silent'
command! -nargs=+ Silent execute 'silent <args>' | redraw!

" Use 'javascript' filetype for *.js files
autocmd VimEnter *.js set filetype=javascript
