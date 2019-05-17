" Enable syntax
syntax enable

" Dark background (needed for proper colors)
set background=dark


" EXTRA HIGHLIGHT GROUPS -------------------------------------------------------

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
autocmd filetype c,cpp autocmd VimEnter,InsertEnter,InsertLeave * call <SID>HighlightC_PreProcDefines()

" Operator Characters
autocmd filetype c,cpp syntax match OperatorChars display "?\|+\|-\|\*\|\^\|;\|:\|,\|<\|>\|&\||\|!\|\~\|%\|=\|)\|(\|{\|}\|\.\|\[\|\]\|/\(/\|*\)\@!"
autocmd BufReadPost * syntax match OperatorChars display "?\|+\|-\|\*\|\^\|;\|:\|,\|<\|>\|&\||\|!\|\~\|%\|=\|)\|(\|{\|}\|\.\|\[\|\]\|/\(/\|*\)\@!"


" HIGHLIGHTS -------------------------------------------------------------------

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
hi  VimCommentString ctermfg=grey
hi  WildMenu         ctermbg=cyan
