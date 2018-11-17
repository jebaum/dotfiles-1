"-------------------------------------------------------------------------------
" EXTRA HIGHLIGHT GROUPS
"-------------------------------------------------------------------------------

" Extra whitespace at the ends of lines
hi ExtraWhitespace cterm=NONE
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Comments in SQL
hi SQL_Comment cterm=NONE
match SQL_Comment /\s*--.*$/
autocmd BufWinEnter *.sql match SQL_Comment /\s*--.*$/
autocmd InsertEnter *.sql match SQL_Comment /\s*--.*$/
autocmd InsertLeave *.sql match SQL_Comment /\s*--.*$/

" C/C++ preprocessor defined macros
function! HighlightC_PreProcDefines()
    syn clear C_PreProcDefine
    for l in getline('1','$')
        if l =~ '^\s*#\s*define\s\+'
            let macro = substitute(l, '^\s*#\s*define\s\+\(\k\+\).*$', '\1', '')
            exe 'syn keyword C_PreProcDefine ' . macro
        endif
    endfor
endfunction
autocmd FileType c,cpp,h,hpp call HighlightC_PreProcDefines()
autocmd InsertEnter c,cpp,h,hpp exec HighlightC_PreProcDefines()

" Operators
syntax match OperatorChars "?\|+\|-\|\*\|;\|:\|,\|<\|>\|&\||\|!\|\~\|%\|=\|)\|(\|{\|}\|\.\|\[\|\]\|/\(/\|*\)\@!"


"-------------------------------------------------------------------------------
" Clear all maches after leaving buffer

autocmd BufWinLeave * call clearmatches()


"-------------------------------------------------------------------------------
" SYNTAX HIGHLIGHT
"-------------------------------------------------------------------------------

hi  ColorColumn   ctermbg=233
hi  Comment       ctermfg=grey
hi  CursorColumn  ctermbg=235
hi  CursorLine    ctermbg=235         cterm=NONE
hi  CursorLineNr  ctermfg=magenta
hi  LineNr        ctermfg=242
hi  Normal        ctermfg=DarkGreen
hi  Number        ctermfg=DarkCyan
hi  Pmenu         ctermfg=black       ctermbg=cyan
hi  PmenuSel      ctermfg=black       ctermbg=blue
hi  PreProc       ctermfg=LightGreen
hi  SignColumn    ctermbg=black
hi  Special       ctermfg=red         ctermbg=black
hi  StatusLine    ctermfg=yellow
hi  StatusLineNC  ctermfg=white
hi  String        ctermfg=DarkCyan
hi  Type          ctermfg=white
hi  WildMenu      ctermbg=cyan

" EXTRA ------------------------------------------------------------------------

hi  C_PreProcDefine  ctermfg=DarkRed
hi  ExtraWhitespace  ctermbg=red
hi  OperatorChars    ctermfg=3


"-------------------------------------------------------------------------------
" HiLink
"-------------------------------------------------------------------------------

hi  link  Noise        OperatorChars
hi  link  SQL_Comment  Comment
