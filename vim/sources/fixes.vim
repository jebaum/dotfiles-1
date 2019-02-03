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
autocmd VimEnter *.js setlocal filetype=javascript

" For any maping with 'd'
nnoremap dd dd
