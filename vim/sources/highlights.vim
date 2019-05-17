" Enable syntax
syntax enable

" Dark background (needed for proper colors)
set background=dark


" ------------------------------------------------------------------------------
" EXTRA HIGHLIGHT GROUPS
" ------------------------------------------------------------------------------

" C/C++ preprocessor defined macros
function! s:HighlightC_PreProcDefines()
    syntax clear C_PreProcDefine
    for l in getline('1','$')
        if l =~ '^\s*#\s*define\s\+'
            let macro = substitute(l, '^\s*#\s*define\s\+\(\k\+\).*$', '\1', '')
            exe 'syntax keyword C_PreProcDefine ' . macro
        endif
    endfor
endfunction
autocmd FileType c,cpp,h,hpp autocmd VimEnter,InsertEnter,InsertLeave * call <SID>HighlightC_PreProcDefines()

" Comments starting with --
autocmd filetype haskell,lua,sql match DoubleHyphenComment /\s*--.*$/

" LUA block comments
autocmd filetype lua syntax region LUA_Comment start='--\[\[' end='\]\]'

" Xdefaults comment
autocmd filetype xdefaults match BangComment /^\!.*$/

" OperatorChars
let s:OperatorChars_blacklist = ["vim", "help", "markdown", "qf", "conque_term", "diff", "html", "css", "less", "xml", "sh", "bash", "notes", "jinja", "php"]
function! s:OperatorChars()
    if index(s:OperatorChars_blacklist, &ft) < 0
        syntax match OperatorChars "?\|+\|-\|\*\|\^\|;\|:\|,\|<\|>\|&\||\|!\|\~\|%\|=\|)\|(\|{\|}\|\.\|\[\|\]\|/\(/\|*\)\@!"
    endif
endfunction
autocmd BufWinEnter * call <SID>OperatorChars()


" ------------------------------------------------------------------------------
" HIGHLIGHTS
" ------------------------------------------------------------------------------

hi  C_PreProcDefine  ctermfg=DarkRed
hi  ColorColumn      ctermbg=233
hi  Comment          ctermfg=grey
hi  CursorColumn     ctermbg=235
hi  CursorLine       cterm=none
hi  CursorLineNr     ctermfg=magenta
hi  debugBreakpoint  ctermfg=black       ctermbg=red
hi  DiffAdd          ctermfg=LightGreen  ctermbg=none
hi  DiffChange       ctermfg=yellow      ctermbg=none
hi  DiffDelete       ctermfg=red         ctermbg=none     cterm=bold
hi  FoldColumn       ctermbg=black
hi  LineNr           ctermfg=242
hi  Normal           ctermfg=DarkGreen
hi  Number           ctermfg=DarkCyan
hi  OperatorChars    ctermfg=3
hi  Pmenu            ctermfg=black       ctermbg=cyan
hi  PmenuSel         ctermfg=black       ctermbg=blue
hi  PreProc          ctermfg=LightGreen
hi  QuickFixLine     ctermbg=NONE        cterm=underline
hi  SignColumn       ctermbg=black
hi  Special          ctermfg=red         ctermbg=black
hi  StatusLine       ctermfg=black       ctermbg=yellow   cterm=NONE
hi  StatusLineNC     ctermfg=white
hi  String           ctermfg=DarkCyan
hi  Type             ctermfg=white
hi  WildMenu         ctermbg=cyan


" LINK -------------------------------------------------------------------------

hi  link  BangComment          Comment
hi  link  DoubleHyphenComment  Comment
hi  link  LUA_Comment          Comment
hi  link  Noise                OperatorChars
hi  link  VimCommentString     Comment
