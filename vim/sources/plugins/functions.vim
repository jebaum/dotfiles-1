"-------------------------------------------------------------------------------
" PLUGINS - FUNCTIONS
"-------------------------------------------------------------------------------

" Build YouCompleteMe - for Plug
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        execute "!./install.py ".g:BuildYCM_flags
    endif
endfunction

" Build YouCompleteMe
function! BuildYCM_manual()
    execute "!~/.vim/bundle/YouCompleteMe/install.py ".g:BuildYCM_flags
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


" ------------------------------------------------------------------------------
" NECESSARY VARIABLES
" ------------------------------------------------------------------------------

let g:BuildYCM_flags = "--clang-completer"


" ------------------------------------------------------------------------------
" CALLING COMMANDS
" ------------------------------------------------------------------------------

command! -nargs=+ RangeFT call RangeFT(<f-args>)
