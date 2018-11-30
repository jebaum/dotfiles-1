"-------------------------------------------------------------------------------
" FOLDING
"-------------------------------------------------------------------------------

autocmd BufReadPre * setlocal foldmethod=indent
autocmd BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif

set foldlevel=10
set foldnestmax=10
set nofoldenable

"-------------------------------------------------------------------------------
"FOLDING RULES FOR LANGUAGES
"-------------------------------------------------------------------------------

" C/C++/Java -------------------------------------------------------------------
function! OutlineToggle()
  if (! exists ("b:outline_mode"))
    let b:outline_mode = 0
  endif
  if (b:outline_mode == 0)
    syn region myFold start="{" end="}" transparent fold
    syn sync fromstart
    set foldmethod=syntax
    silent! exec "%s/{{{/<<</"
    silent! exec "%s/}}}/>>>/"
    let b:outline_mode = 1
  else
    set foldmethod=marker
    silent! exec "%s/<<</{{{/"
    silent! exec "%s/>>>/}}}/"
    let b:outline_mode = 0
  endif
endfunction
autocmd VimEnter * exec OutlineToggle()

" JavaScript -------------------------------------------------------------------
autocmd FileType javascript setlocal foldmethod=syntax
