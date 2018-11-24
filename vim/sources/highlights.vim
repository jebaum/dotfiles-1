"-------------------------------------------------------------------------------
" EXTRA HIGHLIGHT GROUPS
"-------------------------------------------------------------------------------

" C/C++ preprocessor defined macros
function! HighlightC_PreProcDefines()
    syntax clear C_PreProcDefine
    for l in getline('1','$')
        if l =~ '^\s*#\s*define\s\+'
            let macro = substitute(l, '^\s*#\s*define\s\+\(\k\+\).*$', '\1', '')
            exe 'syntax keyword C_PreProcDefine ' . macro
        endif
    endfor
endfunction
autocmd FileType c,cpp,h,hpp call HighlightC_PreProcDefines()
autocmd InsertEnter c,cpp,h,hpp exec HighlightC_PreProcDefines()

" Comments starting with --
autocmd filetype haskell,lua,sql syntax match DoublehyphenComment /\s*--.*$/

" LUA block comments
autocmd filetype lua syntax region LUA_Comment start='--\[\[' end='\]\]'

" Extra whitespace at the ends of lines
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/


"-------------------------------------------------------------------------------
" Clear all maches after leaving buffer

autocmd BufWinLeave * call clearmatches()


"-------------------------------------------------------------------------------
" HIGHLIGHTS
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
hi  Todo          ctermfg=red
hi  Type          ctermfg=white
hi  WildMenu      ctermbg=cyan

" EXTRAS -----------------------------------------------------------------------

hi  C_PreProcDefine  ctermfg=DarkRed
hi  ExtraWhitespace  ctermbg=red


"-------------------------------------------------------------------------------
" LINK
"-------------------------------------------------------------------------------

hi  link  DoublehyphenComment  Comment
hi  link  LUA_Comment          Comment
hi  link  Noise                OperatorChars
