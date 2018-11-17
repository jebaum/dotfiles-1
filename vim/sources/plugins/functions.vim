"-------------------------------------------------------------------------------
" PLUGINS - FUNCTIONS
"-------------------------------------------------------------------------------

" Build YouCompleteMe - for Plug
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py --clang-completer --java-completer
    endif
endfunction

" Build YouCompleteMe
function! BuildYCM_manual()
    !~/.vim/bundle/YouCompleteMe/install.py --clang-completer --java-completer
endfunction

" Set different syntax in range between specified points
function! RangeFT(start, end, filetype, ...)
    let a:include=get(a:,1,0)
    if a:include
        call SyntaxRange#Include(a:start, a:end, a:filetype)
    else
        call SyntaxRange#Include(a:start, a:end, a:filetype, 'NonText')
    endif
endfunction


" CALLING COMMANDS -------------------------------------------------------------
command! -nargs=+ RangeFT call RangeFT(<f-args>)
